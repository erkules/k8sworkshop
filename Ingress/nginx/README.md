helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update


helm upgrade --install -f values.yaml -n nginx --create-namespace   ingress-nginx ingress-nginx/ingress-nginx

#Nicht mehr: Achtung jetzt noch ein Ingressclass setzen, damit der Controller alles nimmt.



