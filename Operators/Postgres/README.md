https://cloudnative-pg.io/
Features durchlesen

Mit krew-Plugin für Adminaufgaben

~~~
kubectl krew install cnpg
~~~

Installation (Helm gibts auch)


~~~
kubectl apply --server-side -f \
  https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.23/releases/cnpg-1.23.2.yaml
~~~

CRDs anschauen

~~~
kubectl api-resources | grep cnpg
~~~


# [Examples](https://cloudnative-pg.io/documentation/1.23/samples/)


# Monitoring


Metriken von cnpg fangen mit `cnpg_` an .. wow

Unter `dashboard.json` haben wir ein kleines Dashboard, klar in Zukunft in ne CM packen.

