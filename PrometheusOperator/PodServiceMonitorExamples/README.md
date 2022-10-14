# Install BlackboxExporter

~~~
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update 
helm upgrade --install -n monitoring prometheus-blackbox-exporter --set pspEnabled=false prometheus-community/prometheus-blackbox-exporter 

~~~
