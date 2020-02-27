kubectl create ns istio-system --dry-run -o yaml >istio.yaml
echo '---' >>istio.yaml
helm2 template ~/GIT/istio-1.4.5/install/kubernetes/helm/istio-init   --name istio-init --namespace istio-system >>istio.yaml
helm2 template  ~/GIT/istio-1.4.5/install/kubernetes/helm/istio --name istio --namespace istio-system \
    --values ~/GIT/istio-1.4.5/install/kubernetes/helm/istio/values-istio-demo.yaml --set values.tracing.enabled=true --set values.kiali.enabled=true >>istio2.yaml

sed -i 's/LoadBalancer/NodePort/' istio2.yaml

kubectl apply -f istio.yaml
kubectl -n istio-system wait --for=condition=complete job --all
kubectl apply -f istio2.yaml
