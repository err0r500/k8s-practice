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

their scheduling is forced on M

> exec into the first one and try to ping the other one

> how far are you able to trace the ping ?

> what's the reason for the packet being stopped there ?

> fix the problem 

<details>
  <summary>hint</summary> 

  strict firewall rules are enforced, you must add the `firewall` cni plugin in order to let it handle these for you.

  update your `/etc/cni/net.d/10-bridge.conflist`

  and add to the plugin list

  ```
      {
        "type": "firewall",
        "backend": "iptables"
      }
  ```

</details>


if your pods are able to ping each other, Congratulations !
