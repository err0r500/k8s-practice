## Auto Scaling


### set autoscaling
`k autoscale deploy <deploy_name> --min=<min_replicas> --max=<replicas> --cpu-percent=<threshold_before_scale>`

> add autoscaling to deployment max 3 replicas and a starting scaling when CPU reaches 50%

> check the resource create (`hpa`)

### generate load

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: load-gen
spec:
  containers:
  - image: busybox
    name: load-gen
    command: ["sleep", "1000"]
```

> create & exec into the pod above

> generate load using the command `while sleep 0.01; do wget -q -O- <target>; done`
