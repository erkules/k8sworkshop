# kind

Wo ihr das kind-Binary herbekommt ist jetzt mal euer Problem.

Search here: https://kind.sigs.k8s.io/docs/user/quick-start/



# (still) Simple 

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

TODO: ist gerade verbuggt


# Add MetalLB (zu einem laufendem Kind)

~~~
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.12/config/manifests/metallb-native.yaml
~~~

MetalLB konfigurieren (sicher anpassen):
(Am dem DockerSubnetz nehmen (wegen Routing und so) 

Hint:

~~~
docker network inspect -f '{{.IPAM.Config}}' kind
~~~

Alte Versionen 0.11.x
~~~
kubectl apply -f metallb-cm.yaml
~~~

Jetze:

~~~
kubectl apply -f metallb-addresspool.yaml
~~~

