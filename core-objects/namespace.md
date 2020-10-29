Virtual clusters backed by the same physical cluster (logical way to group resources, with scoped names). Can't be nested

## get
`k get ns`

## create
`k create ns <namespace_name>`

## scope requests
add the `-n <namespace_name>` to a kubectl command to scope it to the specified namespace

> what pods are running in the "kube-system" namespace ?

> create a namespace called "web"

> create the exact same pod twice in both the current & the web namespace


the current `namespace` can be part of a context (defaults on `default` ns)

> what is your current namespace ?

you can set the namespace using
`k config set-context --current --namespace=<ns_name>`

> set it to kube-system and get the pods

or by editing your kubeconfig file

> set it back to its initial value