#!/bin/bash
# Billiges Beispiel für post-renderer in Helm
# helm ... --post-renderer kustomize-wrapper.sh
# Aber eigentlich doof.
cat <&0 >all.yaml

kubectl kustomize  . && rm all.yaml
