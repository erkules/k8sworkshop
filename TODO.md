https://linsenraum.de/KubernetesCamp/
ArgoCD/gitlab.yaml
Warning: metadata.finalizers: "resources-finalizer.argocd.argoproj.io": prefer a domain-qualified finalizer name to avoid accidental conflicts with other finalizer writers
application.argoproj.io/firstgit created


Die Fluxobjekte müssen geupgraded werden v1beta -> v1 (oder so)

Certs im Mutating-Webhook-Depl sind die vom validation. NUTZE ENDLICH DEN CERT_MANAGER DU HONK

./Kustomize/Helm/kustomization.yaml wirft auf neuen Clustern einen Fehler. Da muss es ein Formatfehler sein


# Operator
* aus OperatorCRD/myoperator.yaml ne kustomization machen
* OperatorCRD/myoperator.yaml als pizza-version umschreiben, auch wenn es nur ein etcd Objekt ist

FIX tutum/curl in Prometheus
It does not do any mounting to the system at all!


VPA?



Labels für Loki/Prometheus so setzen, dass Split-Window effektiv eingesetzt werden kann.

SERVICEMONITOR überarbeiten!!


Secrets/CSI aktualisieren
