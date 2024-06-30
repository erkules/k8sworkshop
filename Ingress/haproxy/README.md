helm repo add haproxytech https://haproxytech.github.io/helm-charts
helm repo update

helm upgrade --install haproxy -f values.yaml --create-namespace -n haproxy haproxytech/kubernetes-ingress 
# Install the Gatway-API

~~~
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml
~~~
