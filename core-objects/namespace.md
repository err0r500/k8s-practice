Virtual clusters backed by the same physical cluster (logical way to group resources, with scoped names). Can't be nested

## get
`k get ns`{{execute}}

## create
`k create ns <namespace_name>`

## scope requests
add the `-n <namespace_name>` to a kubectl command to scope it to the specified namespace

>>what pods are running in the "kube-system" namespace ? <<
(*)

>>create a namespace called "web"<<
(*)

>>create the exact same pod twice in both the current & the web namespace<<
(*)

the namespace can be part of the `cluster` definition `kubeconfig` 

>>what is the current namespace ?<<
(*)