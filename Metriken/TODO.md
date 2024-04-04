Create a Mockup because.

Keda liefert sonst eine leere Liste

~~~
kubectl get --raw /apis/external.metrics.k8s.io/v1beta1 | jq .
~~~

doof

Via:  https://github.com/kubeshop/botkube/issues/829

~~~
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata:
  name: botkube-autoscaler
  namespace: botkube
spec:
  maxReplicaCount: 1
  scaleTargetRef:
    name: botkube
  triggers:
    - type: new-relic
      metadata:
        account: {{ .Values.newrelic.account | quote }}
        queryKey: {{ .Values.newrelic.apikey | quote }}
        region: "US"
        noDataError: "true"
        nrql: "FROM Metric SELECT average(k8s.container.cpuCoresUtilization) AS 'CPU utilization (%)' WHERE k8s.clusterName = 'eks' AND k8s.namespaceName = 'botkube' TIMESERIES"
        threshold: "100"
        activationThreshold: "100"
~~~
