# MySQL

* Ausrollen einer MySQL
* Nicht von Ausserhalb erreichbar


~~~
kubeclt apply -f mysqld-pvc.yml 
kubectl apply -f mysql-deploy.yml
kubectl apply -f mysqld-svc.yaml
~~~

Load Data (job):

~~~
kubectl apply -f mysqld-load-data.yaml
~~~


~~~
kubectl apply -f mysql-client-deploy.yml
kubectl apply -f mysql-client-svc.yml
kubectl apply -f mysql-client-ing.yml
~~~

# Abruf

~~~
curl localhost:8080/cgi-bin/select
~~~
Fertig


# Kurzform

~~~
bash deploy.sh
~~~

