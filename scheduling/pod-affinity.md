## colocate pods in the same "topology"

Inter-pod affinity allows you to constrain which nodes your pod is eligible to be scheduled on based on labels on pods that are already running on the node.

here's a Pod `spec.affinity` :
```
affinity:
  podAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
    - labelSelector:
        matchExpressions:
        - key: security
          operator: In
          values:
          - S1
      topologyKey: kubernetes.io/os
```

this affinity will attempt to match pods with `metadata.labels.security` = "S1"

it will look for the node label `kubernetes.io/os` value

then attempt to schedule the pod on any node with the same label value.

## topologyKey
the topologyKey uses `node` labels

- `beta.kubernetes.io/arch`
- `beta.kubernetes.io/os=linux`
- `kubernetes.io/arch`
- `kubernetes.io/hostname`
- `kubernetes.io/os`

> create a pod with the label cache=web

> using podAffinity, create a deployment with all its pods collocated on the same node than the cache pod


[taints & tolerations](./taints-tolerations.md)
