mycrd-objekt.yaml
mycrd.yaml
myoperator.yaml  


# kubecl-operator-interactive.yaml

* Hier wird ein Pod mit einem `kubectl` ausgerollt.
* `kubectl` rafft, dass er im Pod ist und läuft dann mit entsprechenden rechten des ServiceAccounts :)

# Achtung

Wir nutzen im Skript ein watch call 
Operatoren initialisieren mit einem list call UND einem watch call

ca. so:

~~~
... https://kubernetes.default:443/api/v1/namespaces/${NAMESPACE}/pods?limit=500
... https://kubernetes.default:443/api/v1/namespaces/${NAMESPACE}/pods?watch=true
~~~


