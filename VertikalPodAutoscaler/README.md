#  VPA

Slides vorhanden aba..

Installieren: https://github.com/kubernetes/autoscaler/tree/master

~~~
kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/vpa-release-1.0/vertical-pod-autoscaler/deploy/vpa-v1-crd-gen.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/vpa-release-1.0/vertical-pod-autoscaler/deploy/vpa-rbac.yaml
~~~

~~~
git clone https://github.com/kubernetes/autoscaler.git
~~~



# Bsp 1

~~~
stress-deploy.yaml
stress-vpa.yaml
~~~

# Bsp 2


Das ist im "Off" aka Recommendation only mode: 

~~~
wwwlimitted-deploy.yaml
wwwlimitted-vpa.yaml
~~~
