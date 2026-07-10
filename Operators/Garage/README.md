Wir nutzen den innoffiziellen garage operator
Weil wir hier deklarativ user anlegen können :)

Braucht den cert-manager :)

helm install garage-operator oci://ghcr.io/rajsinghtech/charts/garage-operator \
  --namespace garage-operator-system \
  --create-namespace



# garage direkt nutzen :)
kubectl exec -ti garage-storage-0-0 -- /garage bucket list
