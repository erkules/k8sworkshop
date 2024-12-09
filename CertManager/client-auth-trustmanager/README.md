# We need the trust-manager

~~~
helm upgrade trust-manager jetstack/trust-manager \
  --install \
  --namespace cert-manager \
  --wait
~~~

#  CA-Issuer

Jetze mit Client-auth

* Bsp. für Clusterintern
* Namspaced Issuer
* CA
* Cert für Server 
* Server hat SVC
* Cert für Client
* Client ausgerollt


~~~
curl --cacert ./ca.crt --key tls.key --cert  tls.crt  https://server 
~~~
