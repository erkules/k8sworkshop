# Bsp für Networkpolicy

Dateien:


* basics.yml erstellt drei Deployments.
* pod2pod.yml Zugriff auf rot nur noch von blauen Labeln

Folgendes erlaubt keinen Traeffik von Ausserhalb des Namespaces:

* allepodsimNamespaceErreichensich.yml  (mit namespaceSelector)
* allepodsimNamespaceErreichensichII.yml (mit podSelector)

# Howto

~~~
kubectl apply -f basics.yml
~~~

Erstellt die drei Deployments und Services (blau/lila/rot)

# Pod2Pod
~~~
kubeclt apply -f pod2pod.yml
~~~

Nur noch blau gelabelte Pods dürfen auf "Rotlabel" (und auch nur auf Port 80) zugreifen.

* Keine nicht blau gelabelten Pods dürfen
* Kein anderer als Zielport 80 geht

~~~
kubeclt delete -f pod2pod.yml
~~~


# Kein Zugriff von ausserhalb des Namespaces zulassen:

~~~
kubectl apply -f allepodsimNamespaceErreichensichII.yml 
~~~

alternativ:

~~~
kubectl apply -f allepodsimNamespaceErreichensich.yml 
~~~

Jetz läuft alles wunderbar innerhalb des Namespaces. 

Von ausserhalb ist kein Zugriff möglich.


