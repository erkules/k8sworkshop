Installation via Istio-Operator

~~~
istioctl operator init
kubectl apply -f istiooperator.yaml
kubectl -n istio-system patch  svc istio-ingressgateway --patch '{"spec": {"type": "NodePort"}}'
~~~

