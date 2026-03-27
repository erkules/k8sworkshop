#  CA-Issuer

Jetze mit Client-auth MUSS (sonst gleich öde)

* Bsp. für Clusterintern
* Namspaced Issuer
* CA
* Cert für Server 
* Server hat SVC
* Cert für Client
* Client ausgerollt

Itterationen des Glücks

Die Idee:
- Hüpft in den Pod vom Client
- und führt die folgenden Anweisungen aus
- das erste wird nicht klappen, welch curl das ServerCert nicht kennt
- das zweite klappt nicht, weil der Server Client-Auth haben will
- Aber: Alle guten Dinge sind DREI

~~~
curl  https://server                                                  # :(
curl --cacert ./ca.crt  https://server                                # :(
curl --cacert ./ca.crt --key tls.key --cert  tls.crt  https://server  # \o/
~~~
