a replicaset is a resource that will attempt maintain the number of _any_ pods (`replicas`) matched by the replicaset `selector`

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

## create
>>use this model in order to create a replicaset with 2 replicas of my-pod (created in the manifest section)<<
`vi ./front-rs.yml`{{execute}}
(*)

keep in mind that the `replicaset` selector must be able to match the pod template `metadata`

>>have a look at your pods to see if it worked as expected<<
(*)

>>edit the manifest and change the replicas count to 3<<
(*)

>>add labels to the replicaset in order to be able to select it.<<
(*)

## edit
edit your `pod` manifest ( `vi ./my-first-resource.yml`{{execute}} ) and add it the label `tier: frontend`. Apply this manifest.

>>Do you nothing something with your pods ? why ?<<
(*)
