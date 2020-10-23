a replicaset is a resource that will attempt maintain the number of pods (`replicas`) matching the replicaset `selector`

## Manifest

```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      tier: frontend
  template:
    <podSpec> (without version & kind)
 ```

## Get ReplicaSet

`k get rs`

- DESIRED : nombre de pods doivent etre presents   
- CURRENT : nombre de pods présents   
- READY : nombre de pods ready (healthy) 

## Create
use this model in order to create a replicaset with 2 replicas of `my-pod`