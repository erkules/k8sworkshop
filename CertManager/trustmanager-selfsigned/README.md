# 

* Sehr simple 
* Braucht Trust-Manager

# Uscase

* Wir haben nur ein Cert
* Sonst willen wir für dieses selfsigned Cert die CA verteilen


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
