# Simpler geht's nicht

Unter `base/` ist unsere Applikation/Deployment.

Genaugenommen ist es für sich fertig.

~~~
kubectl apply -k base/ [--dry-run=client -o yaml]
~~~

Oder eben Patchen. 

Hier werden eigene lokale Änderungen vorgenommen.

~~~
kubectl apply -k overlays/test/  --dry-run=client -o yaml
kubectl apply -k overlays/production/  --dry-run=client -o yaml
~~~

