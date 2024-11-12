# Falco

# Install

helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update

# Standard Installation

helm upgrade --install --create-namespace  falco falcosecurity/falco --namespace falco --set falcosidekick.enabled=true --set falcosidekick.webui.enabled=true --set ebpf.enabled=true

# Ohne eigene Rules mit weiterleitung an falco-talon

helm upgrade --install --create-namespace  falco falcosecurity/falco --namespace falco --set falcosidekick.enabled=true --set falcosidekick.webui.enabled=true --set ebpf.enabled=true --set falcoctl.artifact.install.enabled=false --set falcoctl.artifact.follow.enabled=false --set "falco.rules_files={/etc/falco/falco_rules.local.yaml,/etc/falco/rules.d}" --set falcosidekick.config.talon.address=http://falco-talon:2803  --values values.yaml





# Eigene Rules (via Helm)

helm upgrade --install falco falcosecurity/falco --namespace falco --values falco-customrules.yaml --reuse-values

 kubectl delete pods -n falco -l app.kubernetes.io/name=falco

# Delete rules
