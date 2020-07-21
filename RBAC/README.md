# Impersonation

Zum testen

~~~
kubectl get pods --as  --as-group

kubectl get pods --as system:serviceaccount:default:default

kubectl get pods --as ichbineinuser

~~~


hallo-ns-sa-rb.yml: Namespace/ServiceAccount und RBAC für User hallo in Namespace hallo

rolebinding-namespaceadmin.yaml: User kunde wird Admin in dem genutzten/definieren Namespace

rolebinding.yaml: Alle authentifizierten Nutzer dürfen was. (Schau selber nach)

role-pods-list.yml: Einfache Rolle um Pods zu listen

serviceaccount.yaml
