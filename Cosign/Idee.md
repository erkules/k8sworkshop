
Container

# in öder
cosign mit statischem Key
auch verifizieren mit cosign
Harbor und Kyverno

Achtung es ein SignierFramwork aber auch gerade von Attesteations -> SBOM(Software Bill Of Materials) -> SLSA(Supply chain Levels for Software Artifacts) 

# in besser

EXPERIMANTAL cosign
Jetzt geht der Fokus von Keys zu Identitäten

(Mit rektor und fulcio)
Mehr erzählen
z.B. mit rekor-cli nachschauen
~~~
rekor-cli get --log-index ..
~~~
policy-controller oder doch Kyverno (https://kyverno.io/docs/writing-policies/verify-images/)

# Zeigen dass es nicht nur mit OCI geht.

## Wir können auch Binarys (das digest) loggen

Hier ist experimental  echt experimental


~~~
echo haha >hoho.txt
GOSIGN_EXPERIMENTAL=1 cosign sign-blob hoho.txt

~~~

Derzeitiger Stand ohne OIDC und alles selbst machen :/


## SBOM (Software Bill of Materials)

SBOM erstellen

~~~
syft erkules/nginxhostname:v1 -o spdx >nginxhostname.spdx
cosign attach sbom --sbom nginxhostname.spdx
# Das signt aber nichts :/
# Wir müssen das so entstandene Image explizit signen (endet mit sbom)

~~~


# Gitsign


SBOOM

https://edu.chainguard.dev/open-source/sigstore/cosign/how-to-sign-an-sbom-with-cosign/


# kubectl sigstore plugin

kubectl sigstore sign -f deployment.yaml --image erkules/deployment:v1 --tarball=no --key ../Cosign/cosign.key

Hinweis wo alles sigstore drinne ist:

npm
Tekton Chains
Kubernetes
VMWare Tanzu
Redhat
Maven Central
fluxcd  HelmChart.spec.verify (OCI-Images)
...

