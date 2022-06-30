# CSI@Vault oder Vault@CSI? 

Was immer ich mit der Überschrift meine /o\

# Vs. Injector 
https://www.vaultproject.io/docs/platform/k8s/injector-csi
Also CSI (i.e. wegen ISTIO/sidecarpaddern issues)

## Injector

* Sidecar
* Mutating Webhook

## Install Vault&CSI

Repos:

~~~
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts

~~~



~~~
helm install vault hashicorp/vault --set "server.dev.enabled=true"  --set "injector.enabled=false"  --set "csi.enabled=true"
helm install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --namespace kube-system
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







