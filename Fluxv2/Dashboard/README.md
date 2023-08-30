via 

~~~
gitops create dashboard fluxdashboard --password=fluxi --export >dashboard.yaml
kubectl -n flux-system port-forward svc/fluxdashboard-weave-gitops 9001
~~~

login: admin
password: fluxi
