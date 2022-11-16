# Vorerst nur mit Key

~~~
kubectl sigstore sign -f deployment.yaml [--image erkules/deployment:v1] --tarball=no --key cosign.key 
kubectl sigstore verify -f deployment.yaml.signed -k /cosign.pub
kubectl sigstore verify-resource deploy www -k cosign.pub
~~~

