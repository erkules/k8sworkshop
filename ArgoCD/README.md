kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

Optional:

kubectl patch deploy argocd-server -n argocd -p '[{"op": "add", "path": "/spec/template/spec/containers/0/command/-", "value": "--disable-auth"}]' --type json


kubectl -n argocd port-forward  svc/argocd-server 8080:80 

kubectl -n argocd get secret argocd-initial-admin-secret -o json | jq -r .data.password | base64 -d
