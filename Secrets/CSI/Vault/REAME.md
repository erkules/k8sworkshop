# CSI@Vault oder Vault@CSI? 


## Install Vault&CSI

Repos:

~~~
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo add secrets-store-csi-driver https://raw.githubusercontent.com/kubernetes-sigs/secrets-store-csi-driver/master/charts
~~~



~~~
 helm install vault hashicorp/vault --set "server.dev.enabled=true"  --set "injector.enabled=false"  --set "csi.enabled=true"
 helm install csi secrets-store-csi-driver/secrets-store-csi-driver
~~~

## Configure Vault

~~~
kubectl cp kubeauth.txt vault-0:/tmp
kubectl exec vault-0 -- sh /tmp/kubeauth.txt
~~~

## Legen wir noch ein paar Secrets an

kubectl exec -ti vault-0 -- sh 
/ $ vault kv put secret/devops/ich name=erkan  passwort=psst
/ $ exit

## Wir brauchen noch eine (Secret)ProviderClass

~~~
kubectl apply -f secretproviderclass.yaml
~~~

## Create K8s-ServiceAccount

Check kubeauth.txt why

~~~
kubectl create serviceaccount sa2vault
kubectl apply -f pod.yaml
~~~

Check for /secret in the Pod gimmesecret \o/






