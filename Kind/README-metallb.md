
# Add MetalLB (zu einem laufendem Kind) 

P.S. Auch gut (https://kube-vip.io)

~~~
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.8/config/manifests/metallb-native.yaml
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

# API-Server behind MetalLB :)

Nur Zusatz geht ja auch so!!

https://github.com/suse-edge/endpoint-copier-operator/tree/main
-> Link auf SUSE
   https://documentation.suse.com/suse-edge/3.0/html/edge/guides-metallb-kubernetes.html


Aber Achtung in kind läuft der api-server auf 6443 also dementpsrechend anpassen

## Howto

~~~
helm repo add endpoint-copier-operator \
 https://suse-edge.github.io/endpoint-copier-operator

helm install --create-namespace -n endpoint-copier-operator \
 endpoint-copier-operator endpoint-copier-operator/endpoint-copier-operator
~~~

~~~
cat <<-EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: kubernetes-vip
  namespace: default
spec:
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - name: https
    port: 6443
    protocol: TCP
  sessionAffinity: None
  type: LoadBalancer
EOF
~~~


