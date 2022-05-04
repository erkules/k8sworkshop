# Sealed Secrets

~~~
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm repo update
helm upgrade --install sealed sealed-secrets/sealed-secrets
~~~

* Die Un/Sealing Applikation läuft im Cluster
* CLI zum sealen
* SealedSecret.bitnami.com/v1alpha1

Schauen:

Das SealedSecret landet im GIT

 kubeseal  --controller-name=sealed-sealed-secrets --controller-namespace=default
~~~
cat ../secret.yaml | kubeseal -o yaml -
~~~


Applyen:

Ergibt ein Secret und SealedSecret 

~~~
cat ../secret.yaml | kubeseal -o yaml - | kubectl apply -f -
~~~

# kubeseal offline


Getting the Cert:

~~~
kubeseal --cert the-cert.pem
or
kubectl -n kube-system get secret sealed-secrets-key9wkvr -o json | jq -r '.data."tls.crt"' | base64 -d 
~~~

