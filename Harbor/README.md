 Schau auch ins Docker-Repo

 helm repo add harbor https://helm.goharbor.io
 helm repo update

  helm -n default upgrade --install  -f values.yaml harbor harbor/harbor



helm -n harbortest  upgrade --install --create-namespace  -f harborCIP.yaml harbortest harbor/harbor
