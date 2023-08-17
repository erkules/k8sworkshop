helm repo add percona https://percona.github.io/percona-helm-charts/
helm repo update percona

helm upgrade --install --namespace percona -f operator-values.yaml --create-namespace percona percona/pxc-operator


Craete a Cluster
helm upgrade --install --namespace db1 --create-namespace  my-db percona/pxc-db  --set backup.enabled=false
oder mit example.yaml


Root-Passwort:

kubectl get secrets my-db-pxc-db-secrets -o json | jq -r '.data.root|@base64d'



