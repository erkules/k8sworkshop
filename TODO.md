
FIX node-exporter
It does not do any mounting to the system at all!

We switched to CRI
filebeat will not work!!!
multi-line with filebeat and promtail

filebeat:

~~~
              config:
                - type: docker
                  containers.ids:
                    - "${data.kubernetes.container.id}"
                  multiline.pattern: '^[[:space:]]'
                  multiline.negate: false
                  multiline.match: after
~~~

VPA

Soll der Node-Detector in Prometheus/ bleiben? 
Dann müsste er aber auch in das monitoring namespace :/

# Ceph

~~~
    replicapool      1       19 B           3     19 B         0        25 GiB 
[root@erkan3 /]# ceph osd pool autoscale-status
Error ENOTSUP: Module 'pg_autoscaler' is not enabled (required by command 'osd pool autoscale-status'): use `ceph mgr module enable pg_autoscaler` to enable it
~~~
