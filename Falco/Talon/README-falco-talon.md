# Falco talon

helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update
helm upgrade --install falco-talon falcosecurity/falco -n falco --create-namespace --values  falco-talon-helm-values.yaml


~~~
helm upgrade --install falco falcosecurity/falco --namespace falco \
  --create-namespace \
  --set tty=true \
  --set falcosidekick.enabled=true \
  --set falcosidekick.config.talon.address=http://falco-falcosidekick:2801
~~~





