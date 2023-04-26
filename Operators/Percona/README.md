helm repo add percona https://percona.github.io/percona-helm-charts/
helm repo update percona

helm upgrade --install --namespace percona -f operator-values.yaml --create-namespace percona percona/pxc-operator


helm upgrade --install --namespace db1 --create-namespace  my-db percona/pxc-db  --set backup.enabled=false
