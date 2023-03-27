# Instllation Kyvernoe
~~~
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update
helm upgrade --install kyverno kyverno/kyverno -f helm-values.yaml  --namespace kyverno --create-namespace
~~~

Wenn mit Servicemonitor:


~~~
helm upgrade --install kyverno kyverno/kyverno -f helm-operator-valus.yaml   --namespace kyverno --create-namespace
~~~


