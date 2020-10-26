## ensure everything is running :
run

`kubectl get nodes -w`{{execute}}

_NB : this command will fail until the control-plane is initialized (whatever it means), then report `NotReady` nodes, wait for both nodes to be ready before heading to the next section._

## kubectl quick intro
`kubectl` is a binary executable used to interact with the kube-apiserver.

It wraps http requests made against the apiserver, you can see the actual request by adding the `--v=8` flag to any `kubectl` command. (ex: `kubectl get nodes --v=8`{{execute}})

you can list its top level commands using `kubectl -h`{{execute}} and get documentation about subsequent ones using the `-h` flag. (ex: `kubectl get -h`{{execute}})

## explanation of the command

`nodes` are the VMs part of your cluster (we'll see later what it exactly means)

you can add the `-w` flag to "watch" result changes

for short, you can use `k get no -w`{{execute}} (`k` is aliased in this environment) and most resources have an abbreviated name

When you see that both nodes are ready, head over the next step

## view your current config

- _cluster_ declares a specific apiserver
- _user_ declares a way to connect to a server
- _context_ pairs a `cluster` & a `user`
- _current-context_ is the one that will be used when running kubectl commands

to view all available the configs use : `k config view`

to get details about your current context only : `k config view --minify`

>> what's the name of your current context ?<<
(*) ok

>> your current cluster ? <<
(*) ok

>> your current user ? <<
(*) ok