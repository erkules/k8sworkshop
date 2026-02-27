Bsp um mit OCI-Repos zu arbeiten
Das Deployments/ wurde als OCI Image gepusht
flux push artifact oci://docker.io/erkules/fluxoci:v1.0.0     --path="./Deployments"  --source="local-filesystem" --revision="v1.0.0" 



