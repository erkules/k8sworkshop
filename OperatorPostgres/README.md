# PostgresOperator von CrunchyData/https://access.crunchydata.com

Die meisten Dateien sind von https://github.com/CrunchyData/postgres-operator-examples


## Installation

~~~
helm upgrade --install  -n postgresoperator --create-namespace postgresoperator ./helmoperator/
~~~

## 

~~~
kubectl api-resources | grep postgresclusters
~~~

## Install

~~~
kubectl apply -f pg1.yaml
~~~


## Connection

Check:

~~~
kubectl -n pg1 get secret pg1-pguser-pg1 -o json | jq -r .data
~~~

##  psql

~~~
kubectl apply -f psql.yaml
~~~

~~~
kubectl -n pg1 exec -ti psql --sh 
> apk add postgresql-client
> psql
> CREATE TABLE a (id int);
> insert into a(id) values(1);
~~~

## Scale the cluster

Check for replicas in pg1.yaml :)


## HA Check

* mit psql tabelle abfragen
* alten sts checken
* alten sts löschen
* mit psql tabelle abfragen
* checken ob sts neu aufgebaut wurde
* 


