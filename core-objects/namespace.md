Virtual clusters backed by the same physical cluster (logical way to group resources, with scoped names). Can't be nested

## get
`k get ns`

## create
`k create ns <namespace_name>`

## scope requests

you can scope a `kubectl` command to a given namespace using the `-n` flag

> what pods are running in the "kube-system" namespace ?

> get the pods into all namespaces using `--all-namespaces` flag

> create a namespace called "web"

> create the exact same pod twice in both the current & the web namespace

> get the pods into "web"

> delete the "web" namespace

> check the resources into "web"

the current `namespace` can be part of a context (defaults on `default` ns)

> what is your current namespace ?

you can set the namespace using
`k config set-context --current --namespace=<ns_name>`

> set it to kube-system and get the pods

or by editing your kubeconfig file

> set it back to its initial value
