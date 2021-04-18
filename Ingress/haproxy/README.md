helm repo add wener https://charts.wener.tech/
helm install my-haproxy-ingress wener/haproxy-ingress --version 0.0.27 
helm  upgrade --install --set controller.daemonset.useHostPort=true --set controller.kind=DaemonSet  my-haproxy-ingress wener/haproxy-ingress --version 0.0.27 
