# External Secrets

Unter `Webhook/` verwenden wir External-Secrets zum Zertifkaterstellen

## Nur einfaches generieren von Passwörtern

~~~
kubectl apply -f generate-secrets.yaml  
kubectl get secrets
~~~

## Secrets in alles Namespaces mit mit einem Label schreiben

~~~
kubectl apply -f secrets-verteilen.yaml
kubectl create ns haha
kubectl -n haha get secrets
kubectl label ns haha secrets.example.org/database-password="true"
kubectl -n haha get secrets
~~~
