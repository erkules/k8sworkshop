# Helm

~~~
 helm repo add jetstack https://charts.jetstack.io
 helm repo update

 helm install \
   cert-manager jetstack/cert-manager \
     --namespace cert-manager \
       --create-namespace \
         --version v1.3.0 \
            --set installCRDs=true
~~~

# NoHelm

~~~
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.3.0/cert-manager.yaml
~~~

