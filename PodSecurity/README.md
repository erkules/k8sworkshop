# API-Server konifgurieren

--enable-admission-plugins=PodSecurityPolicy

# Sonstige


Check Deployments/deployment-sec.yaml for an example working 

Im Verzeichnis ClusterDefaults sind Yamls welche den Cluster am Laufen halten.
psp-all-root.yaml  Sorgt dafür, dass die ServiceAccounts in kube-system und montitoring (mit zu vielen Rechnten) laufen können.

psp-default-all-authenticated-user.yaml  psp-noroot.yaml
