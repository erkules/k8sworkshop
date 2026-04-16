# CEL to go


Hier befinden sich nur noch CEL-Objekte
Das alte Kyverno-gedöns ist in Old/

# Installation Kyverno
~~~
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update
helm upgrade --install kyverno kyverno/kyverno -f helm-values.yaml  --namespace kyverno --create-namespace
~~~

Wenn mit Servicemonitor: 


~~~
helm upgrade --install kyverno kyverno/kyverno -f helm-operator-valus.yaml   --namespace kyverno --create-namespace
~~~


