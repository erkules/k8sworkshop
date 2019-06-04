# MySQL

* Ausrollen einer MySQL
* Nicht von Ausserhalb erreichbar


~~~
kubectl apply -f mysql-deploy.yml
~~~

Sich mit der Pod/Datenbank verbinden u

* Schema `haha` anlege
* Tabelle `jaja` mit Spalte `id` anlegen
* Einige Werte eingeben

# Die "Applikation"

Achtung: Checken ob der `host` Eintrag von mysql-client-ing.yml
angepasst werden muss.


~~~
kubectl apply -f mysql-client-deploy.yml
kubectl apply -f mysql-client-svc.yml
kubectl apply -f mysql-client-ing.yml
~~~

Fertig




