#!/bin/bash

kubectl apply --wait=true --filename https://github.com/knative/serving/releases/download/v0.14.0/serving-crds.yaml
kubectl apply --wait=true --filename https://github.com/knative/serving/releases/download/v0.14.0/serving-core.yaml
kubectl apply --wait=true --filename https://github.com/knative/net-istio/releases/download/v0.14.0/release.yaml

# Eventig
kubectl apply --wait=true --filename https://github.com/knative/eventing/releases/download/v0.14.0/eventing-crds.yaml
kubectl apply --wait=true --filename https://github.com/knative/eventing/releases/download/v0.14.0/eventing-core.yaml
kubectl apply --wait=true --filename https://github.com/knative/eventing/releases/download/v0.14.0/eventing.yaml
kubectl apply --wait=true --filename https://github.com/knative/eventing/releases/download/v0.14.0/in-memory-channel.yaml
kubectl apply --wait=true --filename https://github.com/knative/eventing/releases/download/v0.14.0/channel-broker.yaml

# Monitoring
kubectl apply --wait=true --filename https://github.com/knative/serving/releases/download/v0.14.0/monitoring-core.yaml
kubectl apply --wait=true --filename https://github.com/knative/serving/releases/download/v0.14.0/monitoring-metrics-prometheus.yaml
kubectl apply --wait=true --filename https://github.com/knative/serving/releases/download/v0.14.0/monitoring-logs-elasticsearch.yaml
kubectl apply --wait=true --filename https://github.com/knative/serving/releases/download/v0.14.0/monitoring-tracing-jaeger-in-mem.yaml
kubectl apply --wait=true --filename https://github.com/knative/serving/releases/download/v0.14.0/monitoring-tracing-zipkin-in-mem.yaml

