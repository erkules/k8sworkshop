
Die Installationsskripte sind mit helm aus dem Istio-Repo erstellt.

~~~
export ISTIODIR=
helm template --namespace=istio-system $ISTIODIR/install/kubernetes/helm/istio-init  >istio-crds.yaml
helm template --namespace=istio-system $ISTIODIR/install/kubernetes/helm/istio  --values values.yaml >istio.yaml
helm template --namespace=istio-system $ISTIODIR/install/kubernetes/helm/istio --values values-extras.yaml >istio-extras.yaml
~~~

Und dann  noch den Gateway-Service auf NodePort setzen.

Installation

~~~
 kubectl create ns istio-system
~~~


