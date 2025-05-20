* Ne Policy schreiben, die PDBs checkt:
* * In nem youtube video geklärt '/home/erkan/YouTube/From Chaos to Control： Cloud Native Governance with Kyverno!.mkv'
* * d.h. MinAvailable == replicas/#Anzahl Pods
* SALS2 examples
* Tags sollen versioning entprechen
* Example mit dem CLI-Für z.B. Tests kann aber auch mehr als nur K8s (keine ahnung ob das mit kyverno json ist ;/)
* Wie gehen wir sicher, dass die eine oder andere Policy gezogen werden muss
* Gibt es sowas wie eine default-policy analog zu networkpolicies?

# NIS

* Backgroundscan
* only one Report pro Resource
* Sollten wir kyberno reports in einen eigenen etcd ausrollen?
* * Noch besser es muss kein etcd sein der API-server kann delegieren und Kyverno macht das schon

validationPolicy ist deprecated -> validate.failurePolicy
