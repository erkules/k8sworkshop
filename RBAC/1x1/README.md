# 

Open in another Terminal/Pane:

~~~
watch kubectl get pods
~~~

Open in another Terminal/Pane:

~~~
kubectl proxy
~~~

Then

~~~
# Verb: create
curl -X POST localhost:8001/api/v1/namespaces/default/pods -H 'Content-Type: application/json' -d @pod.json
# Verb: list
curl localhost:8001/api/v1/namespaces/default/pods
# Verb: get
curl localhost:8001/api/v1/namespaces/default/pods/rbacexample 
# Verb: delete
curl -X DELETE localhost:8001/api/v1/namespaces/default/pods/rbacexample 
~~~

~~~
# kubectl get pods -A 
curl localhost:8001/api/v1/pods 
# kubectl get pods -n kube-system 
curl localhost:8001/api/v1/namespaces/kube-system/pods
# kubectl get  nodes # 
curl localhost:8001/api/v1/nodes 
# kubectl get sts -A
curl localhost:8001/apis/apps/v1/statefulsets 
~~~

