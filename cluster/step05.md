a cluster with a single node is cool, but let's create add another one

> connect to the worker node (worker fqdn is workerk8s.lab)

> are you able to ping the master node ?

> start the kubelet, (you should be able to copy/paste the kubeconfig file from master)

> on the master node, check if the new node appears

> curl the api-server from worker0, do the same from master using localhost, then its fqdn

> use the `--address` flag to fix the problem

> check the nodes

When you have the 2 nodes ready, head over the [next step](./step06.md)
