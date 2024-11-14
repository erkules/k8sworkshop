helm repo add cilium https://helm.cilium.io
helm repo update
helm install tetragon cilium/tetragon -n kube-system


helm upgrade --install -f values.yaml   --set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false  tetragon cilium/tetragon -n kube-system


