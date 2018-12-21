kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

kubectl proxy
 http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/


Create a sericeaccount  and a Rolbinding to get a  Token to sign on at the Dashboard


~~~
kubectl create serviceaccount dashboard -n kube-system
kubectl create clusterrolebinding dashboarduder -n kube-system --clusterrole=cluster-admin --serviceaccount=kube-system:dashboard
~~~

Get Token:

~~~
TOKEN=$(kubectl get secret $(kubectl get serviceaccount dashboard -n kube-system -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" -n kube-system | base64 --decode )
echo $TOKEN
~~~

Use the TOKEN to sign in

