# Secrets via CSI (ContainerStorageInterface)

Geil weil:

* Viele Backends (auch hashicorp)
* Leider keine Möglichkeit verschlüsselt in etcd zu speichern
* Secrets landen als tmpfs im Container/Pod
* Analogie zu Storage (classic) i.e. secretProviderClass
* ENV via Umweg über Kubernetes Secrets (Sync)


