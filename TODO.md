
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

Add node-problem-detector (to Promehteus?)
