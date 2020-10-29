When you specify a Pod, you can optionally specify how much of each resource a Container needs and is limited to. The most common resources to specify are CPU and memory (RAM); there are others.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: frontend
spec:
  containers:
  - name: app
    image: images.my-company.example/app:v4
    resources:
      requests:
        memory: "64Mi"
        cpu: "250m"
      limits:
        memory: "128Mi"
        cpu: "500m"
```

## Resource units 
### CPU 
   On compte en core ou vCPU, on prefere l'exprimer en "millicore" : "250m" (.25 core)
   
** Memory   
   Quantité de Ram
   - E, P, T, G, M, K 
   - Ei, Pi, Ti, Gi, Mi, Ki.
   ex : "128974848", "129e6", "129M", "123Mi"

### Available resource

`k top nodes`

### Best Practice :
request low and let k8s scale out the pods

