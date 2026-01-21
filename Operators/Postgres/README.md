https://cloudnative-pg.io/
Features durchlesen

Mit krew-Plugin für Adminaufgaben

~~~
kubectl krew install cnpg
~~~

Installation (Helm gibts auch)


~~~
kubectl apply --server-side -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/releases/cnpg-1.24.0.yaml
~~~

CRDs anschauen

~~~
kubectl api-resources | grep cnpg
~~~


# [Examples](https://cloudnative-pg.io/documentation/1.23/samples/)

Gerne schauen

# Monitoring


Metriken von cnpg fangen mit `cnpg_` an .. wow

Unter `dashboard.json` haben wir ein kleines Dashboard, klar in Zukunft in ne CM packen.


# Client

```bash
kubectl apply -f clustersimple.yaml
kubectl apply -f psql.yaml
```

```bash
kubectl  exec -ti psql -- sh
> apk add postgresql-client
> psql
> CREATE TABLE a (id int);
> INSERT INTO a (id)
> SELECT i
> FROM generate_series(1, 1000) AS i;

```
