helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add loki https://grafana.github.io/loki/charts
helm repo update

helm upgrade --install -n monitoring --create-namespace -f prometheus-values.yaml  monitoring  prometheus-community/kube-prometheus-stack
helm upgrade --install -n monitoring --create-namespace -f loki-values.yaml loki loki/loki-stack 

# Wichtige Config

~~~
prometheus:
      prometheusSpec:
        podMonitorNamespaceSelector:
          any: true
        podMonitorSelector: {}
        podMonitorSelectorNilUsesHelmValues: false
        ruleNamespaceSelector:
          any: true
        ruleSelector: {}
        ruleSelectorNilUsesHelmValues: false
        serviceMonitorNamespaceSelector:
          any: true
        serviceMonitorSelector: {}
        serviceMonitorSelectorNilUsesHelmValues: false
~~~
