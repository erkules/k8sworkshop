1
2
	
type: clusterIP
commonName: "harbor.pr.ldc.int"

Make sure to edit the commonName to reflect the FQDN you’ll be specifying in your ingressrouter.

For the traefik, I’m using the ingress-router CRD for my cluster which takes care of dynamically creating the routes. For more info, read here: https://docs.traefik.io/routing/providers/kubernetes-crd/

The following is my ingressroute definition:
	
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRouteTCP
metadata:
  name: harbor-route
  namespace: harbor
spec:
  entryPoints:                 
    - web-secure
  routes:                      
  - match: HostSNI(`harbor.pr.ldc.int`)
    services:                  
    - name: harbor             
      port: 443
  - match: HostSNI(`notary.pr.ldc.int`)
    services:                  
    - name: harbor             
      port: 4443         
  tls:                          
    passthrough: true
