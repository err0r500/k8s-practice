## kubectl quick intro
`kubectl` is a binary executable used to interact with the kube-apiserver (for now, think kubernetes)

> get details about your kubernetes cluster using "kubectl cluster-info"

It wraps http requests made against the apiserver, you can see the actual request by adding the `--v=8` flag to any `kubectl` command. (ex: `kubectl get nodes --v=8`)

> try to get the version of your cluster with curl (`<apiserver_endpoint>/version`)

you can list its top level commands using `kubectl -h` and get documentation about subsequent ones using the `-h` flag. (ex: `kubectl get -h`)

## view your current config

> view your current configuration with `k config view --minify`

- _cluster_ declares a specific apiserver
- _user_ declares a way to connect to a server
- _context_ pairs a `cluster` & a `user`
- _current-context_ is the one that will be used when running kubectl commands

to view all available the configs use : `k config view`

> what's the name of your current context ?

> your current cluster ?

> your current user ?

these settings are (usually) stored in the `~/.kube/config` file

> have a look at this file & try to figure out how it works