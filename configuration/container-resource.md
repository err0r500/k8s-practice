When you specify a Pod, you can optionally specify how much of each resource a Container needs and is limited to. The most common resources to specify are CPU and memory (RAM); there are others.

you can use the `spec.containers[].resources` to set resources `requests` and `limits`

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: frontend
spec:
  containers:
  - name: app
    image: nginx 
    resources:
      requests:
        memory: "64Mi"
        cpu: "50m"
      limits:
        memory: "100Mi"
        cpu: "100m"
```

### CPU units
counted in core or vCPU, we usually prefer to express it in "millicore" : "250m" (.25 core)
   
### Memory units
- E, P, T, G, M, K 
- Ei, Pi, Ti, Gi, Mi, Ki.

ex : "128974848", "129e6", "129M", "123Mi"

> create a deployment with an nginx image (1 replica)

> request 64Mi of memory and tenth of vCPU for the container

> generate some load on the server

you can use ( `while true; do <command>; done` )

> check the resources consummed by the pod `k top pod <pod_name>`

> limit to a fifth of vCPU for you container

> check the resources again 

### Available resource

`k top nodes`
`k top pod`

### Best Practice :
request low and let k8s scale out the pods

> k autoscale deploy nginx-deploy --min=1 --max=3 --cpu-percent=80

