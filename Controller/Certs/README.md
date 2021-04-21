Wir hätten auch den Cert-Manager konfigurieren können

Aber so geht das für die Übung schneller 

Jetzt mal mit cfssl 

Das hier dient nur als Doku


~~~
cfssl gencert -initca ca.json | cfssljson -bare ca
~~~


~~~
cfssl gencert \
  -ca=ca.pem \
    -ca-key=ca-key.pem \
      -config=ca-config.json \
        -profile=web-servers \
          webhook-csr.json | cfssljson -bare check 
~~~
