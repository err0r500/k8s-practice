You can bypass the scheduler using static pods. This is how most kubernetes distributions are able to start a control plane with pods...before the controlplane exists

kubelet will schedule every pod whose manifests are located in its `staticPodPath` setting

> log into one of your nodes

> locate your kubelet settings and figure out which path it uses

> update the path in the command below to create a file in the right folder

```
cat <<EOF >/etc/kubernetes/manifests/static-web.yaml
apiVersion: v1
kind: Pod
metadata:
  name: static-web
  labels:
    role: myrole
spec:
  containers:
    - name: web
      image: nginx
EOF
```

> check your pods

> clean up by deleting the file