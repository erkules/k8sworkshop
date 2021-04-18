helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update


helm upgrade --install --set hostPort.enabled=true --set controller.ingressClass=default  ingress-nginx ingress-nginx/ingress-nginx
helm upgrade --install --set hostPort.enabled=true   ingress-nginx ingress-nginx/ingress-nginx

Achtung jetzt noch ein Ingressclass setzen, damit der Controller alles nimmt.



