Kubernetes runs your workload by placing containers into Pods to run on Nodes. A node may be a virtual or physical machine, depending on the cluster. Each node contains the services necessary to run Pods, managed by the control plane.

Typically you have several nodes in a cluster.

The components on a node include the kubelet, a container runtime, and the kube-proxy.

## get 
`k get no`

## describe 
`k describe node <node_name>`

### Addresses
The usage of these fields varies depending on your cloud provider or bare metal configuration.

- _HostName_: The hostname as reported by the node's kernel. 
- _ExternalIP_: Typically the IP address of the node that is externally routable (available from outside the cluster).
- _InternalIP_: Typically the IP address of the node that is routable only within the cluster.

### Conditions
The conditions field describes the status of all Running nodes. Examples of conditions include:

- _Ready_: True if the node is healthy and ready to accept pods, False if the node is not healthy and is not accepting pods, and Unknown if the node controller has not heard from the node in the last node-monitor-grace-period (default is 40 seconds)
- _DiskPressure_: True if the disk capacity is low
- _MemoryPressure_: True memory is low
- _PIDPressure_: True if there are too many processes on the node
- _NetworkUnavailable_: True if the network for the node is not correctly configured


_If the Status of the Ready condition remains Unknown or False for longer than the pod-eviction-timeout (an argument passed to the kube-controller-manager, default is 5'), all the Pods on the node are scheduled for deletion._