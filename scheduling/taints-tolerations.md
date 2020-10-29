## taints
Taints allow a node to repel a set of pods.

you can add a taint to a node using `k taint nodes node1 key=value:NoSchedule`

you pods should by now all be on the same node

> add the taint privacy=low to this node

> what is happening ?

> recreate your pod & check your pods

> remove the taint from the node (same command but using `<key>-`)

> remove the affinity in your deployment 

> add the same taint to the node where are all your pods but using "NoExecute"

> check your pods



# tolerations
Tolerations are applied to pods, and allow (but do not require) the pods to schedule onto nodes with matching taints.

you can set `spec.tolerations`:

```
tolerations:
  - key: "example-key"
    operator: "Exists"
    effect: "NoSchedule"
```

Taints and tolerations work together to ensure that pods are not scheduled onto inappropriate nodes. One or more taints are applied to a node; this marks that the node should not accept any pods that do not tolerate the taints.

> set toleration to match the taint you set before

> delete a pod & check where they are scheduled