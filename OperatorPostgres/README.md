# PostgresOperator von CrunchyData/https://access.crunchydata.com

Die meisten Dateien sind von https://github.com/CrunchyData/postgres-operator-examples


# Installation

vorher:

~~~
kubectl api-resources | grep postgresclusters
~~~


~~~
helm upgrade --install  -n postgresoperator --create-namespace postgresoperator ./helmoperator/
~~~


vorher:

~~~
kubectl api-resources | grep postgresclusters
~~~

# Install

Folgendes installiert einen Cluster


~~~
kubectl apply -f pg1.yaml
~~~


# Connection

* Die Ausgabe brauchen wir nicht.
* Wir wollen nur schauen, dass/welche Passwörter etc. generiert wurden
* Auf diese greifen wir unten automatisch zu

~~~
kubectl -n pg1 get secret pg1-pguser-pg1 -o json | jq -r .data
~~~

#  psql

Hier starten wir einen Pod (checkt die Umgebungsvariablen)

~~~
kubectl apply -f psql.yaml
~~~

Jetze etwas SQL-Magie:


~~~
kubectl -n pg1 exec -ti psql -- sh 
> apk add postgresql-client
> psql
> CREATE TABLE a (id int);
> insert into a(id) values(1);
~~~

# Scale the cluster

Check for replicas in pg1.yaml :)


# HA Check

* mit psql die Tabelle abfragen `SELECT (id)  FROM a`
* checken welher sts der erste war
* diesen sts löschen
* mit psql erneut die Tabelle abfragen
* checken ob sts neu aufgebaut wurde

*freuen* 
