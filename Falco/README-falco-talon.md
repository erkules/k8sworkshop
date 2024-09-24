# Falco taon
git clone https://github.com/Issif/falco-talon.git falco-talon
helm upgrade --install falco-talon ./falco-talon/deployment/helm --namespace falco --values  falco-talon-helm-values.yaml


