#!/bin/sh
kubectl apply -f istio.yaml
kubectl -n istio-system wait --for=condition=complete job --all
kubectl apply -f istio2.yaml
