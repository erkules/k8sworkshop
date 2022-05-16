# kyverno installation

~~~
kyverno-values.yaml
~~~

Hat für classic Prometheus die Annotations im Service gesetzt

# Policy-Reporter

Basic Values mit Loki und Prometheus(Annotations)
~~~
helm repo add policy-reporter https://kyverno.github.io/policy-reporter
helm repo update
helm upgrade --install policy-reporter policy-reporter/policy-reporter --create-namespace -n policy-reporter -f policy-reporter-values.yaml
~~~

# Dasboards

~~~
kyverno-dashboard.json                <<== Für die "doofen" Metriken
policy-reporter-dashboard.json
policy-reporter-details-dashboard.json
~~~

