
Von der Doku

https://knative.dev/docs/install/knative-with-any-k8s/


~~~
  kubectl apply --selector knative.dev/crd-install=true --filename https://github.com/knative/serving/releases/download/v0.9.0/serving.yaml --filename https://github.com/knative/eventing/releases/download/v0.9.0/release.yaml  --filename https://github.com/knative/serving/releases/download/v0.9.0/monitoring.yaml
   kubectl apply --filename https://github.com/knative/serving/releases/download/v0.9.0/serving.yaml  --filename https://github.com/knative/eventing/releases/download/v0.9.0/release.yaml  --filename https://github.com/knative/serving/releases/download/v0.9.0/monitoring.yaml
~~~

Besser

~~~
  kubectl apply --selector knative.dev/crd-install=true -f knative-alles.yaml
  kubectl apply -f knative-alles.yaml
~~~
