#!/bin/bash
cd "${BASH_SOURCE%/*}/" || exit 
pwd
kubectl apply -f istio.yaml
kubectl -n istio-system wait --for=condition=complete job --all
kubectl apply -f istio2.yaml
