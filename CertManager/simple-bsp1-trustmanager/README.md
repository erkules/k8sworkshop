# TrustManager

* muss installiert sein
* Wird gebraucht um (hier) die CA zu verteilen


#  CA-Issuer

* Bsp. für Clusterintern
* Namspaced Issuer
* CA
* Cert für Server 
* Server hat SVC
* Cert für Client
* Client ausgerollt


~~~
curl --cacert /tmp/certs/ca.crt https://server
~~~
