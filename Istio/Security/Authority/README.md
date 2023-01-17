Das klappt

via https://istio.io/latest/docs/tasks/security/authentication/jwt-route/
=> https://istio.io/latest/docs/tasks/security/authorization/authz-jwt/



~~~
kubectl create ns foo
kubectl apply -f <(istioctl kube-inject -f httpbin.yaml) -n foo
kubectl apply -f <(istioctl kube-inject -f sleep.yaml) -n foo
~~~

Auf httpbin:8000 curlen 

~~~
kubectl exec "$(kubectl get pod -l app=sleep -n foo -o jsonpath={.items..metadata.name})" -c sleep -n foo -- curl http://httpbin.foo:8000/ip -sS -o /dev/null -w "%{http_code}\n"
~~~

~~~
kubectl -n foo apply -f requestauthentication.yaml
~~~

Auf httpbin:8000 curlen 

~~~
kubectl exec "$(kubectl get pod -l app=sleep -n foo -o jsonpath={.items..metadata.name})" -c sleep -n foo -- curl http://httpbin.foo:8000/ip -sS -o /dev/null -w "%{http_code}\n"
~~~


~~~
kubectl -n foo apply -f authorizationpolicy.yaml
~~~



~~~
TOKEN=$(cat TOKEN)
kubectl exec "$(kubectl get pod -l app=sleep -n foo -o jsonpath={.items..metadata.name})" -c sleep -n foo -- curl "http://httpbin.foo:8000/headers" -sS -o /dev/null -H "Authorization: Bearer $TOKEN" -w "%{http_code}\n"
~~~
