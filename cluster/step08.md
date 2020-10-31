> create this pod :

```
apiVersion: v1
kind: Pod
metadata:
  name: nutils
spec:
  nodeSelector:
    kubernetes.io/hostname: master
  containers:
  - image: praqma/network-multitool
    command: ["sleep", "10000"]
    name: nutils
```
