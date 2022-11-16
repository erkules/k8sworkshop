Basically it is about attestation (hier eben mit SBOM)


~~~
syft packages erkules/cosign:google -o spdx >cosign.spdx
COSIGN_EXPERIMENTAL=1 cosign attest -predicate ./cosign.spdx --type spdx  erkules/cosign:google
COSIGN_EXPERIMENTAL=1 cosign verify-attestation --type spdx  erkules/cosign:google
~~~
