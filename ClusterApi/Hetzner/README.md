#

~~~
export CLUSTER_TOPOLOGY=true
clusterctl init --infrastructure hetzner
~~~

Wir brauchen für Hetzner und nachher für den CloudControlManager Secrets.
Leider müssen wir das Secret unter zwei Namen anlegen.



## Old School

~~~
export HCLOUD_CONTROL_PLANE_MACHINE_TYPE=cax21
export HCLOUD_REGION=fsn1
export HCLOUD_WORKER_MACHINE_TYPE=cax21
export KUBERNETES_VERSION=1.30.9
export SSH_KEY_NAME=k8s
~~~

Secret mit API-Token muss noch ausgerollt werden!eins11!!

~~~
clusterctl generate cluster hallo  --infrastructure hetzner >hallo-cluster.yaml
~~~

Gerne mal die replicas des MachineDeployments ändern


Ausrollen und überwachen:

~~~
kubectl apply -f hallo-cluster.yaml
hcloud server list
clusterctl describe  cluster hallo
clusterctl get kubeconfig hallo >/tmp/hallo.yaml
~~~

Jetzt müssten wir noch Iterativ mind. Netzwer und CCM installieren

oder eben "Automatisieren"

Directory: ./cluster-crs

Krücken loswerden:

~~~
clusterctl move --to-kubeconfig /tmp/hallo.yaml
kind delete cluster
\o/
~~~

## ClusterClass

Directory: ./clusterclass

Manuell mit ClusterClass




