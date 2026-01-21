Hier sollen Fehler provoziert werden

Sich das Objekt anzuschauen reicht aber als Zusatz:

kubectl get events -n flux-system --sort-by=.lastTimestamp -w

