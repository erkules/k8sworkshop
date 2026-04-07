# Gateway API 

Wir gehen davon aus, dass wir ein Gatway-API installiert haben.

~~Z.B. `./Ingress/haproxy`~~ HAProxy ist für Gateway-API mift!

## Envoy Gateway

Geht auch. 
Müssen nur noch passende GatewayClass ausrollen.
In diesem Verzeichnis :)


```bash
helm install eg  oci://registry-1.docker.io/envoyproxy/gateway-helm --version v1.7.1
```

