# Storage muss da sein


# Externer Certmanager

https://docs.gitlab.com/charts/installation/tls.html

# Wir haben schon einen nginx

# Installationswirrwarr

helm upgrade --install  gitlab gitlab/gitlab  --set global.hosts.domain=infra.zwerk.org --set certmanager-issuer.email=erkan@linsenraum.de -n gitlab --create-namespace --set global.edition=ce --set certmanager.installCRDs=false --set global.hosts.externalIP=78.47.167.113 --timeout=600s 

# Passwort 

setzen 

oder 

~~~
kubectl get secret gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo

~~~


Wenn wir den Cermanager deinstalliert haben:

helm upgrade --install  gitlab gitlab/gitlab  --set global.hosts.domain=infra.zwerk.org --set certmanager-issuer.email=erkan@linsenraum.de -n gitlab --create-namespace --set global.edition=ce  --set global.hosts.externalIP=78.47.167.113 --timeout=600s 
