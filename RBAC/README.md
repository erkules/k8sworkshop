# Impersonation

Zum testen

~~~
kubectl get pods --as  --as-group

kubectl get pods --as system:serviceaccount:default:default

kubectl get pods --as ichbineinuser

~~~


hallo-ns-sa-rb.yaml: Namespace/ServiceAccount und RBAC für User hallo in Namespace hallo

rolebinding-namespaceadmin.yaml: User kunde wird Admin in dem genutzten/definieren Namespace

rolebinding.yaml: Alle authentifizierten Nutzer dürfen was. (Schau selber nach)

role-pods-list.yaml: Einfache Rolle um Pods zu listen

serviceaccount.yaml
