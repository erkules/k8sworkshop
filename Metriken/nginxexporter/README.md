# Idee 

* Vorstellung
* Nignx/Exporter ausrollen
* Service/Podmonitor ausrollen
* keda
* wrk




# Hee wir haben ne kustomization



----------- INGORE -------------
# Nignx/Exporter ausrollen

Öffnet einen Port 30080

~~~
kubectl apply -f nginxwithexporter.yaml
~~~

# Service/Podmonitor ausrollen

~~~
kubectl apply -f podmonitor.yaml
~~~

# keda

~~~
kubectl apply -f keda.yaml
~~~

# wrk

In einem Pod im gleichen Namespace (alpine hat das wrk Paket)

~~~
wrk -c 10 -d 1M   http://nginxwithexporter
~~~

# Eigene Metriken

BusyboxExporter (simple)
PrometheusLibrary


# Optional

Alerting
Grafana




