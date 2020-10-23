Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.

A Pod is a group of one or more containers, with shared storage/network resources, and a specification for how to run the containers.

# Get pods (in current namespace)
We just retrieved our pod using the command `k get po <pod_name>` if you want to get all pods, you can ommit the `pod_name`

- Do you see something new ?
- What's its name ?
- the READY column displays : running containers / total containers, do you notice something ?
- the `-o` flag let's you customize the output of the command, 
  - you can set it to `wide` to get more info : on which node is the pod running ? are you able to ping it ?
- use the `describe` command (it works like `get`) to find out
  - the name of the running containers
  - the image that are used for each one
- use the terminal of the `node` it's running on
- do you see the containers ? you can filter them with grep and their name 
- stop one of our pod containers and check the pod again, what changes do you see ?
- the name is not the single way to find a node, you can add `labels` to the metadata.
- using the `get` command to list all pods :
  - add the `--show-labels` flag to... show the labels !
  - you can then use the `-l "key=value"` to filter the pods by label, are you able to isolate our new friend