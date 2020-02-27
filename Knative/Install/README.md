
Von der Doku

https://knative.dev/docs/install/knative-with-any-k8s/


~~~
  kubectl apply --selector knative.dev/crd-install=true --filename https://github.com/knative/serving/releases/download/v0.12.0/serving.yaml --filename https://github.com/knative/eventing/releases/download/v0.12.0/release.yaml  --filename https://github.com/knative/serving/releases/download/v0.12.0/monitoring.yaml
   kubectl apply --filename https://github.com/knative/serving/releases/download/v0.12.0/serving.yaml  --filename https://github.com/knative/eventing/releases/download/v0.12.0/release.yaml  --filename https://github.com/knative/serving/releases/download/v0.12.0/monitoring.yaml
~~~

Besser

wget -O - https://github.com/knative/serving/releases/download/v0.12.0/serving.yaml      >knative-alles.yaml
wget -O - https://github.com/knative/eventing/releases/download/v0.12.0/eventing.yaml    >>knative-alles.yaml
wget -O - https://github.com/knative/serving/releases/download/v0.12.0/monitoring.yaml  >>knative-alles.yaml

~~~

  kubectl apply --selector knative.dev/crd-install=true -f knative-alles.yaml
  sleep 5
  kubectl apply --selector knative.dev/crd-install=true -f knative-alles.yaml
  kubectl apply -f knative-alles.yaml
~~~
