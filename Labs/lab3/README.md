# Lab 1: Rechte eines GitLab-Runner-Jobs untersuchen

## Ziel

In diesem Lab wird ausschließlich untersucht:

1. Mit welcher Kubernetes-Identität läuft der simulierte CI-Job?
2. Welche effektiven Rechte besitzt diese Identität?
3. Durch welches Binding wurden die Rechte erteilt?
4. Sind die Rechte auf einen Namespace begrenzt oder clusterweit?

Noch **nicht** Bestandteil dieses Labs sind:

- Secrets auslesen
- Datenbankzugriffe
- Privilege Escalation im Container
- NetworkPolicies, Istio oder Cilium
- vollständige Härtung

## Szenario

Das Deployment `gitlab-runner-job` ist kein echter Runner-Manager. Es
simuliert einen von einem GitLab Runner gestarteten, nicht vertrauenswürdigen
CI-Job.

## Installation

```bash
kubectl apply -f lab1.yaml
kubectl rollout status -n lab1 deployment/gitlab-runner-job
```

## Aufgabe 1: Workload und ServiceAccount bestimmen

```bash
kubectl get pods -n lab1

kubectl get deployment gitlab-runner-job -n lab1 \
  -o jsonpath='{.spec.template.spec.serviceAccountName}{"\n"}'
```

Fragen:

1. Handelt es sich um den Runner-Manager oder um einen Runner-Job?
2. Welcher ServiceAccount wird verwendet?
3. Ist der ServiceAccount ein Kubernetes-API-Objekt?

## Aufgabe 2: Token-Mount überprüfen

```bash
kubectl exec -n lab1 deployment/gitlab-runner-job -- \
  ls -la /var/run/secrets/kubernetes.io/serviceaccount
```

Optional den Anfang des Tokens anzeigen:

```bash
kubectl exec -n lab1 deployment/gitlab-runner-job -- \
  sh -c 'head -c 40 /var/run/secrets/kubernetes.io/serviceaccount/token; echo'
```

Fragen:

1. Warum wurde das Token automatisch gemountet?
2. Welche Identität repräsentiert das Token voraussichtlich?
3. Ist der Besitz eines Tokens bereits gleichbedeutend mit
   `cluster-admin`-Rechten?

## Aufgabe 3: Effektive Rechte prüfen

Vom Administrationsrechner per Impersonation:

```bash
kubectl auth can-i --list \
  --as=system:serviceaccount:lab1:gitlab-job
```

Gezielte Prüfungen:

```bash
kubectl auth can-i get pods -A \
  --as=system:serviceaccount:lab1:gitlab-job

kubectl auth can-i get secrets -A \
  --as=system:serviceaccount:lab1:gitlab-job

kubectl auth can-i create clusterrolebindings \
  --as=system:serviceaccount:lab1:gitlab-job
```

Fragen:

1. Welche auffällige Zeile erscheint bei `--list`?
2. Sind die Rechte auf `lab1` beschränkt?
3. Welche Bedeutung haben Wildcards bei Ressourcen und Verben?
4. Was prüft `--as`: Authentifizierung oder Autorisierung?

Hinweis: Der aufrufende Benutzer benötigt selbst das Recht, ServiceAccounts zu
impersonieren.

## Aufgabe 4: Übersicht mit access-matrix

Falls das Krew-Plugin installiert ist:

```bash
kubectl access-matrix --sa lab1:gitlab-job
```

Zum Vergleich mit explizitem Namespace:

```bash
kubectl access-matrix --sa lab1:gitlab-job -n lab1
```

Fragen:

1. Warum ist die Fehlkonfiguration bereits ohne `-n lab1` sichtbar?
2. Wann müsste der Namespace zwingend angegeben werden?
3. Was wäre bei einem RoleBinding anders?

## Aufgabe 5: Verantwortliches Binding finden

```bash
kubectl get rolebindings -A
kubectl get clusterrolebindings
```

Das verdächtige Binding untersuchen:

```bash
kubectl get clusterrolebinding gitlab-job-cluster-admin -o yaml
```

Die referenzierte Rolle untersuchen:

```bash
kubectl get clusterrole cluster-admin -o yaml
```

Fragen:

1. Welches Subject erhält die Rechte?
2. Welche ClusterRole wird referenziert?
3. Warum ist keine selbst definierte Role notwendig?
4. Warum gelten die Rechte im gesamten Cluster?
5. Was wäre der Unterschied zu einem RoleBinding, das auf dieselbe
   ClusterRole zeigt?

## Erwartetes Ergebnis

Die Fehlkonfiguration ist:

```text
ServiceAccount lab1/gitlab-job
  → ClusterRoleBinding gitlab-job-cluster-admin
  → ClusterRole cluster-admin
  → clusterweiter Vollzugriff
```

Der entscheidende Punkt ist nicht, dass ein ServiceAccount-Token existiert.
Gefährlich ist die Autorisierung, die über das ClusterRoleBinding mit dieser
Identität verbunden wurde.

## Cleanup

```bash
kubectl delete -f lab1.yaml --ignore-not-found
```

Kontrollieren, dass insbesondere das clusterweite Binding entfernt wurde:

```bash
kubectl get clusterrolebinding gitlab-job-cluster-admin
# Erwartet: NotFound
```

Nur den Namespace zu löschen wäre unzureichend: Ein ClusterRoleBinding ist
clusterweit und würde als verwaistes Binding bestehen bleiben.
