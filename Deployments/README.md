Hier ein paar Deployments


|   File                      | Erklärung  
| --------------------------- | ----------------
| deployment.yml              | Unser erstes Deployment
| deployment-nodeaffinity.yml | Bitte bei deploy-nodeaffinity.yml  darauf achten, dass Nodes auch passend gelabelt werden sollten.
| deployment-antiaffinity.yml | Eine harte Antiaffinity um Pods zu verteilen
| deployment-canary.yml       | Ein zweites Deploy mit gleichem label 
| deployment-probe.yml        | Hier haben wir ein readinessProbe zum Checken von Ready/Available
| deployment-security.yml     | Deployment aka --user bei Docker
