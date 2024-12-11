#  CA-Issuer

Jetze mit Client-auth

* Bsp. für Clusterintern
* Namspaced Issuer
* CA
* Cert für Server 
* Server hat SVC
* Cert für Client
* Client ausgerollt

Itterationen des Glücks

~~~
curl  https://server                                                  # :(
curl --cacert ./ca.crt  https://server                                # :(
curl --cacert ./ca.crt --key tls.key --cert  tls.crt  https://server  # \o/
~~~
