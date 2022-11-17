# Vorerst nur mit Key(nana)

~~~
kubectl sigstore sign -f deployment.yaml [--image erkules/deployment:v1] --tarball=no --key cosign.key 
kubectl sigstore verify -f deployment.yaml.signed -k /cosign.pub
kubectl sigstore verify-resource deploy www -k cosign.pub
~~~

# Keyless
~~~
COSIGN_EXPERIMENTAL=1 kubectl sigstore sign -f deployment.yaml 
COSIGN_EXPERIMENTAL=1 kubectl sigstore verify -f deployment.yaml.signed
COSIGN_EXPERIMENTAL=1 kubectl sigstore verify-resource deploy www 
~~~

