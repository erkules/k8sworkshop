Basically it is about attestation (hier eben mit SBOM)


~~~
# SBOM erstellen
syft scan erkules/nginxhostname:v1 -o spdx >cosign.spdx
# Achtung lädt die Attestation auch hoch (mit crane herunter laden :)
# oder gerne mit rekor-cli checken
cosign attest -predicate ./cosign.spdx --type spdx  erkules/nginxhostname:v1
cosign verify-attestation --type spdx  erkules/nginxhostname:v1 --certificate-identity 'erkan.yanar@linsenraum.de'  --certificate-oidc-issuer-regexp github.com/login/oauth  
~~~
