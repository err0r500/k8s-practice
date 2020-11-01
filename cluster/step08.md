> create these pod :

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

---

apiVersion: v1
kind: Pod
metadata:
  name: nutils2
spec:
  nodeSelector:
    kubernetes.io/hostname: master
  containers:
  - image: praqma/network-multitool
    command: ["sleep", "10000"]
    name: nutils

```

its scheduling is forced on M

> ping an nginx pod on 

