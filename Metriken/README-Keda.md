# Keda

https://keda.sh

Eine andere Art zu skalieren. 

Erspart den Prometheus-Adapter

~~~
helm repo add kedacore https://kedacore.github.io/charts
helm repo update
helm upgrade --install keda kedacore/keda --namespace keda --create-namespace
~~~

Siehe keda.yaml
