# Installation


~~~
kubectl apply -f contour.yaml
~~~

* Contour läuft als DS aber nur auf Port 8080.
* Dafür (8)443 weg und den hostPort 80->8080
* Auch ne Toleration hinzugefügt damit es auf dem Master läuft
* Da kommt es sich mit Ingress nicht ins Gehege
* Hätten wir Service.Loadbalancer wäre - selbstreden - alles anders

