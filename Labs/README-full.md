# Lab 1: Kompromittierter GitLab-Job

> **Warnung:** Dieses Lab bindet einen ServiceAccount absichtlich per
> `ClusterRoleBinding` an die eingebaute `cluster-admin`-Rolle. Nur auf einem
> wegwerfbaren Schulungscluster verwenden.

Das Setup enthÃ¤lt keinen echten GitLab Runner. Das Deployment
`gitlab-runner-job` simuliert einen vom Runner gestarteten CI-Job, in dem ein
Angreifer bereits eine Shell besitzt.

Der Job ist auf zwei unabhÃ¤ngigen Wegen gefÃ¤hrlich:

1. Nicht benÃ¶tigte Datenbank-Credentials liegen in seiner Prozessumgebung.
2. Ein automatisch gemountetes ServiceAccount-JWT gehÃ¶rt zu einem
   `cluster-admin`-ServiceAccount.

Das Setup wird in **Lab 1** fÃ¼r AuthN/AuthZ verwendet und spÃ¤ter im
Abschluss-Lab fÃ¼r Secrets, Runtime Security und Netzwerk wieder aufgegriffen.

## Enthaltene Dateien

- `lab.yaml`: Namespace, Secrets, PostgreSQL, simulierter Job und absichtlich
  gefÃ¤hrliches ClusterRoleBinding
- `istio-policies.yaml`: STRICT mTLS und identitÃ¤tsbasiertes Deny zur Datenbank
- `cilium-policy.yaml`: Netzwerk-Deny vom Job zur Datenbank

## Lernziele von Lab 1

- ServiceAccount als Kubernetes-IdentitÃ¤t erkennen
- kurzlebiges, projiziertes Bearer-JWT untersuchen
- AuthN und AuthZ voneinander trennen
- effektive Rechte des Tokens bestimmen
- Unterschied zwischen RoleBinding und ClusterRoleBinding verstehen
- Auswirkungen eines `cluster-admin`-Bindings nachvollziehen

## Installation

```bash
kubectl apply -f lab.yaml

kubectl rollout status -n lab1 deployment/database
kubectl rollout status -n lab1 deployment/gitlab-runner-job
```

Kontrolle:

```bash
kubectl get pods,service,serviceaccount -n lab1
kubectl get clusterrolebinding gitlab-job-cluster-admin
```

## Ausgangssituation

Ihr habt eine Shell in einem nicht vertrauenswÃ¼rdigen CI-Job erhalten:

```bash
kubectl exec -n lab1 deploy/gitlab-runner-job -it -- sh
```

Der Pod heiÃŸt absichtlich `gitlab-runner-job`: Er ist nicht der
Runner-Manager, sondern ein von ihm gestarteter Job-Pod. Ein Job-Pod sollte die
Kubernetes-Rechte des Runner-Managers niemals erben.

## Aufgabe 1: Datenbankzugang untersuchen

Im Job-Pod:

```sh
env | grep '^PG'
psql -c 'SELECT * FROM customers;'
```

Fragen:

1. Woher stammen die Variablen `PGUSER` und `PGPASSWORD`?
2. BenÃ¶tigt ein beliebiger CI-Job diese Credentials fachlich?
3. Ã„ndert es das Risiko wesentlich, ob das Secret als Environment oder Datei
   Ã¼bergeben wird, sobald der Container kompromittiert ist?

## Aufgabe 2: ServiceAccount-Token finden

Im Job-Pod:

```sh
SA=/var/run/secrets/kubernetes.io/serviceaccount

ls -la "$SA"
head -c 40 "$SA/token"
echo
cat "$SA/namespace"
```

Fragen:

1. Warum ist das Token vorhanden?
2. Ist das Token selbst die IdentitÃ¤t oder ein Nachweis fÃ¼r eine IdentitÃ¤t?
3. Was ist der erwartete Wert des `sub`-Claims?
4. Welche Bedeutung haben `iss`, `aud`, `iat` und `exp`?

Erwartetes Subject:

```text
system:serviceaccount:lab1:gitlab-job
```

### JWT auf dem Arbeitsplatz dekodieren

```bash
TOKEN=$(kubectl exec -n lab1 deploy/gitlab-runner-job -- \
  cat /var/run/secrets/kubernetes.io/serviceaccount/token)

TOKEN="$TOKEN" python3 - <<'PY'
import base64
import json
import os

payload = os.environ["TOKEN"].split(".")[1]
payload += "=" * (-len(payload) % 4)
print(json.dumps(json.loads(base64.urlsafe_b64decode(payload)), indent=2))
PY
```

Merksatz:

> OIDC und ServiceAccounts verwenden beide signierte Bearer-JWTs. Sie
> unterscheiden sich vor allem durch Aussteller und IdentitÃ¤tsmodell.

## Aufgabe 3: API direkt aus dem Pod aufrufen

Im Job-Pod:

```sh
SA=/var/run/secrets/kubernetes.io/serviceaccount
TOKEN=$(cat "$SA/token")
APISERVER=https://kubernetes.default.svc

wget -qO- \
  --ca-certificate="$SA/ca.crt" \
  --header="Authorization: Bearer $TOKEN" \
  "$APISERVER/api/v1/nodes"
```

Fragen:

1. Warum darf ein namespaced ServiceAccount Nodes lesen?
2. Welche Komponente authentifiziert das Token?
3. Welche Komponente entscheidet anschlieÃŸend Ã¼ber den Zugriff?

## Aufgabe 4: Effektive Rechte bestimmen

Von auÃŸen per Impersonation:

```bash
kubectl auth can-i --list \
  --as=system:serviceaccount:lab1:gitlab-job
```

Eine konkrete PrÃ¼fung:

```bash
kubectl auth can-i create clusterrolebindings \
  --as=system:serviceaccount:lab1:gitlab-job
```

`--as` prÃ¼ft hier die Autorisierung einer impersonierten IdentitÃ¤t. Es testet
nicht, ob und wie sich diese IdentitÃ¤t tatsÃ¤chlich authentifizieren kann. Der
aufrufende Benutzer benÃ¶tigt selbst das Recht zur Impersonation.

### Ãœbersicht mit `access-matrix`

Wenn das Krew-Plugin installiert ist:

```bash
kubectl access-matrix --sa lab1:gitlab-job
```

Da die Berechtigung aus einem `ClusterRoleBinding` stammt, ist fÃ¼r den
clusterweiten Ãœberblick kein Namespace erforderlich. Ein `RoleBinding` wÃ¼rde
hingegen nur bei einer Abfrage seines konkreten Namespace sichtbar:

```bash
kubectl access-matrix --sa lab1:gitlab-job -n lab1
```

Die umgekehrte Frage beantwortet `who-can`:

```bash
kubectl who-can create clusterrolebindings
kubectl who-can get secrets -A
```

## Aufgabe 5: Das gestohlene Token tatsÃ¤chlich verwenden

Damit nicht versehentlich die Admin-Credentials aus dem normalen Kubeconfig
verwendet werden, wird ein leerer Kubeconfig benutzt:

```bash
TOKEN=$(kubectl exec -n lab1 deploy/gitlab-runner-job -- \
  cat /var/run/secrets/kubernetes.io/serviceaccount/token)

APISERVER=$(kubectl config view --minify \
  -o jsonpath='{.clusters[0].cluster.server}')

CA=$(mktemp)
kubectl get configmap kube-root-ca.crt -n lab1 \
  -o jsonpath='{.data.ca\.crt}' > "$CA"

ATTACKER=(
  kubectl
  --kubeconfig=/dev/null
  --server="$APISERVER"
  --certificate-authority="$CA"
  --token="$TOKEN"
)
```

Nun wird ausschlieÃŸlich das gestohlene Token verwendet:

```bash
"${ATTACKER[@]}" auth can-i --list
"${ATTACKER[@]}" get secrets -A
"${ATTACKER[@]}" get nodes
```

Ein nicht in den Job gemountetes Secret lesen:

```bash
"${ATTACKER[@]}" get secret cloud-credentials -n lab1 \
  -o jsonpath='{.data.secret-key}' | base64 -d
echo
```

Lateral Movement in den Datenbank-Pod:

```bash
"${ATTACKER[@]}" exec -n lab1 deploy/database -- \
  psql -U training -d training -c 'SELECT * FROM customers;'
```

## Aufgabe 6: Ursache erklÃ¤ren

```bash
kubectl get clusterrolebinding gitlab-job-cluster-admin -o yaml
kubectl get clusterrole cluster-admin -o yaml
```

Fragen:

1. Warum ist keine selbst definierte Role oder ClusterRole notwendig?
2. Warum macht das `ClusterRoleBinding` die Rechte clusterweit?
3. Was wÃ¤re anders, wenn ein `RoleBinding` im Namespace `lab1` auf die
   ClusterRole `cluster-admin` zeigen wÃ¼rde?
4. Warum ist `cluster-admin` fÃ¼r einen CI-Job besonders gefÃ¤hrlich?
5. Wie kÃ¶nnte der Angreifer dauerhaften Zugriff erzeugen?

Antwort auf Frage 3:

> Ein RoleBinding begrenzt auch eine referenzierte ClusterRole auf namespaced
> Ressourcen im Namespace des RoleBindings. Erst ein ClusterRoleBinding macht
> die Regeln clusterweit wirksam.

## Aufgabe 7: HÃ¤rtung formulieren

FÃ¼r diesen simulierten Job lautet der minimale Zielzustand:

1. `gitlab-job-cluster-admin` entfernen.
2. Runner-Manager und Job-Pods verwenden unterschiedliche ServiceAccounts.
3. Der Job erhÃ¤lt standardmÃ¤ÃŸig kein API-Token.
4. Falls ein Job deployen muss, erhÃ¤lt er einen eigenen, eng begrenzten
   ServiceAccount fÃ¼r einen definierten Ziel-Namespace.
5. Datenbank-Credentials werden nur Workloads bereitgestellt, die sie fachlich
   benÃ¶tigen.

Die zentrale Einstellung am Job-Pod:

```yaml
spec:
  serviceAccountName: gitlab-job
  automountServiceAccountToken: false
```

Das Feld im Pod hat Vorrang vor der Einstellung am ServiceAccount. Ein Token
kann trotz `false` weiterhin explizit als `projected` Volume eingebunden
werden.

## Erweiterung: Istio

Quelle und Ziel mÃ¼ssen Teil des Mesh sein. FÃ¼r den Sidecar-Modus:

```bash
kubectl label namespace lab1 istio-injection=enabled --overwrite
kubectl rollout restart -n lab1 deployment/database deployment/gitlab-runner-job
kubectl rollout status -n lab1 deployment/database
kubectl rollout status -n lab1 deployment/gitlab-runner-job
kubectl apply -f istio-policies.yaml
```

Test:

```bash
kubectl exec -n lab1 deploy/gitlab-runner-job -c job -- \
  env PGCONNECT_TIMEOUT=3 psql -c 'SELECT * FROM customers;'
```

`PeerAuthentication` fordert STRICT mTLS. Die `AuthorizationPolicy` verweigert
dem ServiceAccount `lab1/gitlab-job` den Zugriff auf TCP/5432. Die
ServiceAccount-IdentitÃ¤t steht Istio durch mTLS zur VerfÃ¼gung.

## Erweiterung: Cilium

Auf einem Cluster mit Cilium:

```bash
kubectl apply -f cilium-policy.yaml

kubectl exec -n lab1 deploy/gitlab-runner-job -c job -- \
  env PGCONNECT_TIMEOUT=3 psql -c 'SELECT * FROM customers;'
```

Die CiliumNetworkPolicy verweigert nur dem ServiceAccount `gitlab-job` den
Zugriff auf TCP/5432. `enableDefaultDeny: false` verhindert, dass die
Deny-Demonstration automatisch alle anderen Datenbank-Clients blockiert.

Mit Hubble:

```bash
hubble observe --namespace lab1 \
  --from-pod gitlab-runner-job --to-port 5432
```

## Erwartete Diskussion

- Ein kurzlebiges JWT begrenzt die zeitliche Nutzung nach einem Diebstahl. Es
  korrigiert keine zu weitreichenden RBAC-Rechte.
- Wer Pods erstellen darf, kann Secrets eines Namespace hÃ¤ufig indirekt als
  Volume in einen neuen Pod mounten â€“ auch ohne direktes `get secrets`.
- Ein externer Secret Store verhindert nicht, dass eine berechtigte oder
  kompromittierte Workload das ausgelieferte Secret ausliest.
- Netzwerk-Policies begrenzen Datenpfade, ersetzen aber kein minimales RBAC.
- `cluster-admin` im CI/CD-Kontext verwandelt manipulierten Pipeline-Code in
  eine vollstÃ¤ndige ClusterÃ¼bernahme.

## Cleanup

Nicht nur den Namespace lÃ¶schen: Das `ClusterRoleBinding` ist clusterweit und
wÃ¼rde dabei bestehen bleiben. Am sichersten ist:

```bash
kubectl delete -f cilium-policy.yaml --ignore-not-found
kubectl delete -f istio-policies.yaml --ignore-not-found
kubectl delete -f lab.yaml --ignore-not-found
rm -f "$CA"
```

Kontrolle:

```bash
kubectl get clusterrolebinding gitlab-job-cluster-admin
# Erwartet: NotFound
```

