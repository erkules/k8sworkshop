# Authentifizierung
# User im ./kube/config anlegen


~~~
kubectl config set-credentials oidc \
  --exec-api-version=client.authentication.k8s.io/v1beta1 \
  --exec-command=kubectl \
  --exec-arg=oidc-login \
  --exec-arg=get-token \
  --exec-arg=--oidc-issuer-url=https://linsenraum.de/auth/realms/k8s \
  --exec-arg=--oidc-client-id=k8s
~~~


kubectl einen neuen Context erstellen und nutzen:

~~~
kubectl config set-context oidc --user=keycloak --cluster=kubernetes
kubectl config use-context oidc
~~~

# Autorisierung

~~~
# RBAC für authentifizierten User (i.e. erkan@linsenraum.de)
# rolebinding-namespaceadmin.yaml anpassen

kubect create ns  <wasduwillst>
kubectl -n <wasduwillst>  apply -f rolebinding-namespaceadmin.yaml 
~~~

Jetzt via oidc-Kontext auf den Cluster zugreifen
