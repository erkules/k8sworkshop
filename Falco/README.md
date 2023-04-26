# Schwerpunkt auf eBPF

helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update
helm upgrade --install --create-namespace  falco falcosecurity/falco --namespace falco --set falcosidekick.enabled=true --set falcosidekick.webui.enabled=true --set ebpf.enabled=true
helm upgrade --install --create-namespace  falco falcosecurity/falco -f values.yaml --namespace falco 

