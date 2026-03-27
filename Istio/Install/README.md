helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
helm upgrade --install --create-namespace istio-base istio/base  -n istio-system --wait
kubectl api-resources | grep istio.io
helm upgrade --install istiod istio/istiod -f values.yaml  -n istio-system --wait
