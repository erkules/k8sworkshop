# GitLab-Runner-/Datenbank-Lab

Dieses absichtlich unsichere Setup simuliert einen kompromittierten CI-Runner.
Es benötigt keine GitLab-Instanz. Der Pod heißt `gitlab-runner` und läuft mit
einem PostgreSQL-Client als Werkzeugcontainer.

Das Lab zeigt zwei unabhängige Angriffswege:

1. Das Datenbankpasswort liegt in der Prozessumgebung des Runner-Containers.
2. Der projizierte ServiceAccount-JWT erlaubt zu weitreichende Zugriffe auf die
   Kubernetes API.

Alle Ressourcen liegen der Einfachheit halber im Namespace
`k8s-security-lab`. Die Datenbank verwendet ein `emptyDir`; ein Löschen des
Pods entfernt die Daten.

## Installation

```bash
kubectl apply -f lab.yaml
kubectl rollout status -n k8s-security-lab deployment/database
kubectl rollout status -n k8s-security-lab deployment/gitlab-runner
```

## Einstieg in den kompromittierten Runner

```bash
kubectl exec -n k8s-security-lab deploy/gitlab-runner -it -- sh
```

## Angriffsweg 1: Datenbankpasswort

Das Secret wurde gezielt für diesen Container als Umgebungsvariable
konfiguriert:

```sh
env | grep '^PG'
psql -c 'SELECT * FROM customers;'
```

`psql` verwendet `PGHOST`, `PGDATABASE`, `PGUSER` und `PGPASSWORD`
automatisch. Der Service `database` stellt den Endpunkt im selben Namespace
bereit.

## Angriffsweg 2: ServiceAccount-JWT

```sh
SA=/var/run/secrets/kubernetes.io/serviceaccount
TOKEN=$(cat "$SA/token")
NAMESPACE=$(cat "$SA/namespace")
APISERVER=https://kubernetes.default.svc

wget -qO- \
  --ca-certificate="$SA/ca.crt" \
  --header="Authorization: Bearer $TOKEN" \
  "$APISERVER/api/v1/namespaces/$NAMESPACE/secrets"
```

Ein konkretes, nicht gemountetes Secret lässt sich ebenfalls lesen:

```sh
wget -qO /tmp/cloud.json \
  --ca-certificate="$SA/ca.crt" \
  --header="Authorization: Bearer $TOKEN" \
  "$APISERVER/api/v1/namespaces/$NAMESPACE/secrets/cloud-credentials"

cat /tmp/cloud.json
```

Die Werte unter `.data` sind Base64-kodiert. Ein kopierter Wert lässt sich so
dekodieren:

```sh
echo '<BASE64-WERT>' | base64 -d
```

Weitere API-Zugriffe des Tokens:

```sh
wget -qO- \
  --ca-certificate="$SA/ca.crt" \
  --header="Authorization: Bearer $TOKEN" \
  "$APISERVER/api/v1/namespaces/$NAMESPACE/pods"
```

Von außen lassen sich die erteilten Rechte übersichtlich prüfen:

```bash
kubectl auth can-i --list \
  --as=system:serviceaccount:k8s-security-lab:gitlab-runner \
  -n k8s-security-lab
```

## Erwartete Diskussion

- Das Datenbankpasswort ist für den Runner fachlich nicht erforderlich und
  sollte ihm deshalb gar nicht bereitgestellt werden.
- Ein separates ServiceAccount pro Workload begrenzt die Identität, aber erst
  minimales RBAC begrenzt ihre Rechte.
- Ein kurzlebiger JWT begrenzt die zeitliche Nutzung nach einem Diebstahl. Er
  korrigiert keine zu weitreichenden RBAC-Rechte.
- Eine NetworkPolicy kann den direkten Datenbankzugriff des Runners verhindern.
- Ein externer Secret Store verhindert allein nicht, dass eine berechtigte
  Workload das ausgelieferte Secret ausliest.

## Aufräumen

```bash
kubectl delete namespace k8s-security-lab
```
