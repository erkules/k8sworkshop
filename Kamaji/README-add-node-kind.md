#  Tenent-Cluster-Nodes

Wer mit kind spielt will vielleicht single Nodes starten und diese dann einem Tenant zuordnen


Wir holen uns den 
Musste ich machen. Erklärung folgt

~~~
sudo sysctl -w fs.inotify.max_user_instances=256
~~~

Wir starten hier einen node im kind-cluster Network `--net kind`

~~~
docker run --net kind --privileged --security-opt seccomp=unconfined --security-opt apparmor=unconfined --tmpfs /tmp --tmpfs /run --volume /var --volume /lib/modules:/lib/modules:ro -e KIND_EXPERIMENTAL_CONTAINERD_SNAPSHOTTER --name kaji --hostname kaji --tty --init=false --cgroupns=private --rm  kindest/node:v1.27.3 /sbin/init
docker exec -ti kaji bash
~~~

Hier dann den das Ergebnis von 

--ignore-preflight-errors sollte noch web.

Auch sicher gehen, dass kein Swap auf dem Host läuft

~~~ 
kubeadm --kubeconfig ${xxx}.kubeconfig  token create  --print-join-command  --ignore-preflight-errors=all
~~~ 

eingeben


