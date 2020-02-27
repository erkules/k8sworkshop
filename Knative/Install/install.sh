#!/bin/bash

kubectl apply --selector knative.dev/crd-install=true -f knative-alles.yaml
sleep 5
kubectl apply --selector knative.dev/crd-install=true -f knative-alles.yaml
kubectl apply -f knative-alles.yaml  
