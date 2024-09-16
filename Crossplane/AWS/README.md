# Install Crossplane

~~~
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm install crossplane --namespace crossplane-system --create-namespace crossplane-stable/crossplane
~~~


# Install the Provider


----
kubectl apply -f provider.yaml
kubectl get provider.pkg.crossplane.io/provider-aws -w
----

# Get Credentials


----
kubectl create secret generic aws-provider -n crossplane-system --from-file=creds=$HOME/.aws/credentials
kubectl apply -f providerconfig.yaml
----


Bucket und Objekt anlegen:


~~~
kubectl apply -f s3.yaml
kubectl apply -f s3-object.yaml
~~~
