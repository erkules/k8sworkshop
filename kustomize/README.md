
Beispiel für kubectl kustomize um Configmaps in eignen Dateien zu verwalten.


~~~
kubectl kustomize .  | kubectl apply -f -
~~~

kubectl kustomize liest die kustomization.yaml.

Die kustomization.yaml beschreibt das Deployment.
