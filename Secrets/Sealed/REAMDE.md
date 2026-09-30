# Sealed Secrets

~~~
helm repo add sealed-secrets https://bitnami.github.io/sealed-secrets
helm repo update
# Wenn es so installiert wird, findet kubeseal den controller :/
helm install sealed-secrets -n kube-system --set-string fullnameOverride=sealed-secrets-controller sealed-secrets/sealed-secrets
~~~

* Die Un/Sealing Applikation läuft im Cluster
* CLI zum sealen

Schauen:

Das SealedSecret landet im GIT

~~~
cat secret.yaml | kubeseal -o yaml -
~~~


Applyen:

Ergibt ein Secret und SealedSecret 

~~~
cat ../secret.yaml | kubeseal -o yaml - | kubectl apply -f -
~~~

# kubeseal offline


Getting the Cert:

~~~
kubeseal --fetch-cert >cert.pem
~~~

Ohne laufenden Cluster nutzen
~~~
kubectl --cert cert.pem 
~~~

Achtung bitte lieber nicht nutzen

