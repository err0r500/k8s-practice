## cordon

You can mark as "unschedulable" a node of your cluster, usually for maintenance purpose using the command `k cordon <node_name>`

> cordon one your nodes & check your pods

> find out how you can check if a node has been cordoned

> delete your deployment pods & check where they're scheduled

> uncordon your node

## drain

You can directly evict pods from the node & cordon it using the drain command

> drain the node where all your pods are

> cleanup : uncordon the node