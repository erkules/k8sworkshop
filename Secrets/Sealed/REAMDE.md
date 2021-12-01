# Sealed Secrets

* Die Un/Sealing Applikation läuft im Cluster
* CLI zum seaelen
* SealedSecret.bitnami.com/v1alpha1

Schauen:

Das SealedSecret landet im GIT

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

