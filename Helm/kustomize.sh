#!/bin/bash
# Billiges Beispiel für post-renderer in Helm
# helm ... --post-rendere ./kustomize.sh
# Aber eigentlich doof.
cat <&0 >all.yaml

kustomize build . && rm all.yaml
