# Gatekeeper v3


Ist das gatekeeper.yaml von der Website. Sind 
nur annotations für Prometheus dabei.

~~~
kubectl apply -f gatekeeper.yaml
~~~

Ne nette Library:

~~~
https://github.com/open-policy-agent/gatekeeper-library
~~~

# Für Audit

Audits hängen an den Constraints. 
 `¯\_(ツ)_/¯ ` 

~~~
https://github.com/sighupio/gatekeeper-policy-manager
kubectl apply -k . 
~~~

# templates/constraints

Sind auch vom Repo genommen.

# Prometheus

Erste Prometheus-Metriken existieren. Still a long way to go :)


# Achtung

Die Constraints `match`en.
`namespaces`, `excludedNamespaces` und `namespaceSelector` matchen auch auf Cluster (not namespaced)
Ressourcen `¯\_(ツ)_/¯ ` 

Daher bitte den `scope` anpassen (default ist `*`. Also `Namespaced` und `Cluster`)

~~~
match:
  scope: Namespaced
~~~




