you can force the scheduling of a pod on a given node using this manifest

```
apiVersion: v1
kind: Pod
metadata:
  name: pinger
spec:
  nodeSelector:
    kubernetes.io/hostname: <nodeName>
  containers:
  - image: praqma/network-multitool
    command: ["sleep", "10000"]
    name: nutils
```

> are you able to ping a node from a pod running on another one ?

> are you able to ping a pod from a pod running on another node ?

> are you able to ping a pod from a pod running on the same node ?

> Damn ! How far are you able to trace the ping ?

> what reason can you think of for the packet to be stopped there ?

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

  you must then restart the pods for the new rules to take effect !

</details>

if your pods are able to ping each other, congratulations you've got a very basic (and insecure) working cluster !
