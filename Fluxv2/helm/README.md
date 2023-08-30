Wir haben hier 2x Releases:
helm-release.yaml
helm-patched-release.yaml

Das helm-patched-release.yaml zeigt wie Helmcharts nachträglich (postrenderer) angepasst
werden können. Hier wird `kustomize` voll utilisiert.

Idee ist z.B. Vendor-HelmCharts anzupassen, da diese nicht verändert werden können.
Selbstredend ist das nur ein Fix für die Unfähigkeit des HelmCharts :/
