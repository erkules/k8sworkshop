# 

Execute in a Terminal/Pane:

~~~
watch kubectl get pods
~~~

Execute in another Terminal/Pane:

~~~
kubectl proxy
~~~

In a third Terminal/Pane:

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

# Namespaced Objects

We still need a way to Authorize/Restrict access to a specific `Namespace`

Please enjoy the fileystemlayout :)


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

