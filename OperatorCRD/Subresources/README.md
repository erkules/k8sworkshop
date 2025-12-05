# Ohne subresource: status
 kubectl patch pizza hallihallo  --type=merge -p='{"status": { "order": "received"}}'
 kubectl patch pizza hallihallo  --type=merge -p='{"status": { "order": "in_production"}}'
# mit subresource: status
 kubectl patch durum erkan  --subresource=status  --type=merge -p='{"status": { "order": "received"}}'
 kubectl patch durum erkan  --subresource=status  --type=merge -p='{"status": { "order": "in_production"}}'

# Patch new objects:

#!/bin/bash
kubectl get durum -w --output-watch-events  --ignore-not-found --no-headers  --output="custom-columns=type:type,object_name:object.metadata.name" | while read line ;
do
  EVENT=$(echo "$line" | awk '{print $1}')
  RESOURCE_NAME=$(echo "$line" | awk '{print $2}')
  if [ "$EVENT" == "ADDED" ] 
  then
    echo "Durum order ${RESOURCE_NAME} received: $(kubectl get durum erkan -o jsonpath='{.spec.durum}')"
    sleep 1
    kubectl patch durum ${RESOURCE_NAME}  --subresource=status  --type=merge -p='{"status": { "order": "received"}}'
  fi
done
