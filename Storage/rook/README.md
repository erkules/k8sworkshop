# Checken

~~~
watch kubectl -n rook-ceph get CephCluster
~~~


# Debugging

~~~
kubectl apply -f ceph-toolbox.yaml
kubectl -n rook-ceph exec -it deploy/rook-ceph-tools -- bash
~~~

~~~
    ceph status
    ceph osd status
    ceph df
    rados df
~~~

