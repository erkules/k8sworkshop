# Simpler geht's nicht

Unter `base/` ist unsere Applikation/Deployment.

Genaugenommen ist es für sich fertig.

~~~
kubectl apply -k base/ [--dry-run=client -o yaml]
~~~

Oder eben Patchen. 

Hier werden eigene lokale Änderungen vorgenommen.

~~~
kubectl apply -k overlays/test/ 
kubectl apply -k overlays/production/ 
~~~

* Wir können es auch ausrollen.
* Beide Installation gehen in unterschiedliche Verzeichnisse
* Änderungen in Base werden beiden Umgebungen zu Gute kommen



