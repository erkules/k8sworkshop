# Installing the Rook-Operator

```bash
helm repo add rook-release https://charts.rook.io/release
helm install --create-namespace --namespace rook-ceph rook-ceph rook-release/rook-ceph # -f values.yaml
```

Check new CRDs
```bash
kubectl api-resources --api-group=ceph.rook.io
```

Labeld 3 Nodes 

```bash
kubectl label node <nodename>  ceph-osd=true
kubectl	node-shell <nodename> 
kubectl apply -f labeln-ds.yaml
```

CephCluster

```bash
kubectl apply -f cephcluster.yaml
```


# Debugging

```bash
kubectl krew install rook-ceph
kubectl rook-ceph ceph status


```
