# kubectl proxy 

~~~
kubectl proxy
~~~

# Create Pod

~~~
curl  http://localhost:8001/api/v1/namespaces/default/pods \
 -XPOST -H 'Content-Type: application/json' \
 -d@nginx-pod.json \
 | jq '.status'
~~~


# Delete Pod

~~~
curl  http://localhost:8001/api/v1/namespaces/default/pods/nginx -XDELETE
~~~
