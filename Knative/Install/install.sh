#!/bin/bash

kubectl apply --wait=true --selector  knative.dev/crd-install=true -f knative-alles.yaml
kubectl apply --wait=true --selector  knative.dev/crd-install=true -f knative-alles.yaml
kubectl apply -f knative-alles.yaml  
