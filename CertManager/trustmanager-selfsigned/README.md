# 

Selbst Bootstrapping :D
Nutzt selfsigned issuer zum Bootstrappen :D

Achung auf bundle achten. Wie müssen in den Namespace ein Secret schieben, damit der Trust-Manager den pickt (Trusted Namespace).

~~~
curl --cacert /tmp/certs/ca.crt https://server
~~~
