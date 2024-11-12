# kube-vip

Install:

kind:

~~~
kind create cluster --config kind.yaml
~~~

kube-vip
~~~
kubectl apply -f https://raw.githubusercontent.com/kube-vip/kube-vip-cloud-provider/main/manifest/kube-vip-cloud-controller.yaml
~~~

Checkt, dass die range aus dem kind-Netzwerk kommt!

Schauen in welchem Netzwerk Kind läuft:

~~~
docker network inspect kind -f '{{ range $i, $a := .IPAM.Config }}{{ println .Subnet }}{{ end }}'
~~~


~~~
kubectl create configmap --namespace kube-system kubevip --from-literal range-global=172.18.100.10-172.18.100.30
~~~

~~~
kubectl apply -f https://kube-vip.io/manifests/rbac.yaml
~~~

~~~
kubectl apply -f kube-vip-ds.yaml
~~~
