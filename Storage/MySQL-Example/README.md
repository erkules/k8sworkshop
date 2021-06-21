# MySQL

* Ausrollen einer MySQL
* Nicht von Ausserhalb erreichbar


~~~
kubeclt apply -f mysqld-pvc.yaml 
kubectl apply -f mysql-deploy.yaml
kubectl apply -f mysqld-svc.yaml
~~~

Load Data (job):

~~~
kubectl apply -f mysqld-load-data.yaml
~~~


~~~
kubectl apply -f mysql-client-deploy.yaml
kubectl apply -f mysql-client-svc.yaml
kubectl apply -f mysql-client-ing.yaml
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

