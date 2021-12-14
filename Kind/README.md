# kind

Wo ihr das kind-Binary herbekommt ist jetzt mal euer Problem


Im Verzeichnis ist ein kind.yaml.

Gerne anpassen


~~~
kind  create cluster --name haha --config  kind.yml 
~~~

# Kind mit CNI

~~~
kind-cni.yml
~~~

Die letzten beiden Zeilen im kind-cni.yml ausführen :)


# Add MetalLB

~~~
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/metallb.yaml

~~~

MetalLB konfigurieren (sicher anpassen):
(Am Besten aus dem Subnetz für die Nodes nehmen (wegen Routing und so)

~~~
kubectl apply -f metallb-cm.yaml
~~~

