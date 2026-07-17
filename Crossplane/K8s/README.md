# Ziel

Kurze Einführung in Crossplane


# Begriffe

- CompositeResourceDefinition (XRD)
  - Definiert eine API
  - Baut einen CRD
  - Liefert dazu aber auch den Controller
- Composition 
  - Eine Implementierungsmöglichkeit der API
- Composite Resource (XR) / Claim (XRC)
  - die konkrete Instanz
- Managed Resources (MR)
  - Provider stellen verschiedene Ressourcen (MR) zur Verfügung
  


# Installation

```
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm upgrade --install crossplane  --namespace crossplane-system  --create-namespace crossplane-stable/crossplane

```

# Aktivate K8s-Provider

List of Providers: https://marketplace.upbound.io/providers

```
kubectl apply -f k8s-providerUndConfig.yaml
```

## Functions installieren

Auch doof und hier kein Focus aber muss

```
kubectl apply -f function-patch-and-transform.yaml
kubectl get functions 
```

# Kubernetes-Objekt über den Provider erstellen:

```
kubectl apply -f k8sCRdirekt.yaml
```

Ist aber nicht die Idee.

# XRD

```
kubectl apply -f simple-xrd.yaml
kubectl get xrd
kubectl get crd
```

Aber was passiert wenn ich jetzt eine XR erstelle?
Genau es fehlen noch die Implementierungen:

# Compsition

