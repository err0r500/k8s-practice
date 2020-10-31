> scale your deployment to 4 replicas

> look at your pods, do they span over the 2 nodes ?

> look at their IP addresses, notice something ?

pods just get the ip addresses assigned by docker, we need to allow kubernetes to manage them.

the service responsible for assigning Pod IP addresses is kubelet, set the `--network-plugin=cni`

> does it work ? it needs to be setup.

```
sudo mkdir -p /etc/cni/net.d

cat <<EOF | sudo tee /etc/cni/net.d/10-bridge.conf
{
    "cniVersion": "0.3.1",
    "name": "bridge",
    "type": "bridge",
    "bridge": "cnio0",
    "isGateway": true,
    "ipMasq": true,
    "ipam": {
        "type": "host-local",
        "ranges": [
          [{"subnet": "10.0.1.0/24"}] 
        ],
        "routes": [{"dst": "0.0.0.0/0"}]
    }
}
EOF
```

> restart the kubelet

> kill the pods from nginx deployment (`-l app=nginx`) and check their IPs

> check the network interfaces on the host. 

you should see cnio0 appeared

> curl a pod running on the node you're on

it should work

> do the same on the worker node, (change the subnet so they don't overlap)

> kill again the same pods so they all get a correct IP 

Kubernetes is now handling IP assignations using CNI.
