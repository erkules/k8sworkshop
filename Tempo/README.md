# Tempo Helminstall

~~~
helm repo add grafana https://grafana.github.io/helm-charts
helm upgrade --install -n tempo --create-namespace --set tempo.searchEnabled=true tempo  grafana/tempo

~~~

# Grafana DataSource

* Port 3100

Eventuell eine DataSource erstellen? :)

https://grafana.com/docs/grafana/latest/datasources/tempo/


# Starte den Loadgenerator

via https://raw.githubusercontent.com/grafana/tempo/main/example/helm/single-binary-extras.yaml

kubectl apply -f single-binary-extras.yaml
