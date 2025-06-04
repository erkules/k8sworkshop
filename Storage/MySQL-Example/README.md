# MySQL

* Ausrollen einer MySQL
* Nicht von Ausserhalb erreichbar


~~~
kubectl apply -f mysqld-pvc.yaml 
kubectl apply -f mysqld-deploy.yaml
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

Bitte in den mysql-client hüpfen

und curl installieren

~~~
apt-get update
apt-get install -y curl 
~~~

Und nun das CGI-aufrufen

~~~
watch curl -s localhost:8080/cgi-bin/select
~~~

Fertig


# Kurzform

~~~
bash deploy.sh
~~~

