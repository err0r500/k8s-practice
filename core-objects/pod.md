Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.

A Pod is a group of one or more containers, with shared storage/network resources, and a specification for how to run the containers.

## manifest
minimal example : 

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
```

doc : https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.19/#pod-v1-core

## get pods (in current namespace)
We just retrieved our pod using the command `k get po <pod_name>` if you want to get all pods, you can ommit the `pod_name`

>>Do you see something new ?<<
(*)ok

>>What's its name ?<<
(*)ok

>>the READY column displays : running containers / total containers, do you notice something ?<<
(*)ok

the `-o` flag let's you customize the output of the command, you can set it to `wide` to get more info.

>>on which node is the pod running ?<< 
(*) <-

>>are you able to ping it ?<< (*)

>>our first pod was using nginx, can you `curl` it ?<<
(*)

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

## shared resources 
first of all : use this only if you have to !

the new pod has a volume called shared storage, mounted in every container.
- use the describe command to figure out where the volume is mounted in each container.

you can execute commands in a kubernetes pod, like in a container. For instance, you can open a shell in the previous pod using `k exec -it my-pod -- bash`{{execute}}

If the pod has several containers, it will default to one another, to get control of which container you execute the command in, you have to add the flag `--container=<container_name>`

Use this to open a shell in each container of the new pod (you can open a new browser terminal or use tmux)
- check the containers are actually able to write in the same volume

Containers in the same pod also share network interfaces. 
Are you able to reach the redis container from the other one ? (you can use `nc`, and just submit a `ping`, redis default port is `6379`)

## create a pod
the imperative way : `k run <podName> --image=<podContainerImage>`
    
the declarative way :
- generate manifest : `k run <podName> --image=<podContainerImage> --dry-run=client -o yaml > mypod.yml`
- (optionally) : edit the file
- apply the manifest : `k apply -f ./myPod.yml`

- recreate the new pod (with a new name in order to avoid conflicts)

## edit a pod 
_NB_ : most fields are not allowed to edit, you must then delete the resource and recreate it

imperative way : `k edit <podName>`

declarative way :
- `k get po <podName> -o yaml > myPod.yml`
- `k apply -f ./myPod.yml`

## delete a pod

`k delete po <pod_name>`
`k delete po --all`
