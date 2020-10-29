## Node selector
Using the field `spec.nodeSelector` of a Pod, you can assign it to a node with matching labels

to see the labels of a node, you can add `--show-labels` to the `get` command

> check the labels of your nodes

You can set labels to a resource using the `k label` command

> add the label size=small to a node

> create a deployment with 3 replicas & with the pod template using the nodeSelector field set to the label above


## Node affinity
To express more complex node selection, you can use "node affinity" by setting the `spec.affinity.nodeAffinity` field

You can then require or prefer a match using respectively :

`requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms(selector)` 

`preferredDuringSchedulingIgnoredDuringExecution[].{weight(int[1-100]), preference(selector)}`

Both can be combined to express "hard" & "soft" requirements

> label another node to size=medium

> use nodeAffinity "require..." to match this new node (see below for the selector)

> check where your pods are scheduled

> set the requiredAffinity to : `kubernetes.io/os` Not "widows" 

> check where your pods are scheduled

> set the preferedAffinity to size=medium 

> remove the size label from your nodes 

> check your pod, what can we conclude ?

### Selector

the selector is a array of `matchExpressions` looking for node labels :

```
matchExpressions:
- key: <labelKey>
  operator: <operator> 
  values: <value(s)>
```

Possible operator values are `In`, `NotIn`, `Exists`, `DoesNotExist`, `Gt`, `Lt`

Using "negative" operators (like `NotIn`) is usually reffered as "anti-affinity"

If you specify multiple `matchExpressions` associated with `nodeSelectorTerms` (require), then the pod can be scheduled onto a node only if _all_ `matchExpressions` are satisfied.

## Combinations 

If you specify both nodeSelector and nodeAffinity, _both must be satisfied_ for the pod to be scheduled onto a candidate node.

If you specify multiple `nodeSelectorTerms` (require), then the pod can be scheduled onto a node if _any_ of the nodeSelectorTerms can be satisfied.