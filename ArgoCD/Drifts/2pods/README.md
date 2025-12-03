# Multiple Example

Deploy Setup:

```bash
kubectl apply -k Setup/
```

all the deployments/pod get label and the memory set.

But only one is outofsync :)

why?

Now deploy your hpa -> deployment is out of sync to.

From now on play with legacy draft ignoreDifferences/RespectIgnoreDifferences=true

an in the end check SSA -> anotations -> s/false/true/g


