kubectl apply -f https://github.com/knative/operator/releases/download/v0.18.0/operator.yaml
cat <<-EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: knative-serving
---
apiVersion: operator.knative.dev/v1alpha1
kind: KnativeServing
metadata:
  name: knative-serving
  namespace: knative-serving
---
apiVersion: v1
kind: Namespace
metadata:
  name: knative-eventing
---
apiVersion: operator.knative.dev/v1alpha1
kind: KnativeEventing
metadata:
  name: knative-eventing
  namespace: knative-eventing
---
apiVersion: v1
kind: Namespace
metadata:
  name: knative-monitoring
---
EOF
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.18.0/monitoring-metrics-prometheus.yaml
