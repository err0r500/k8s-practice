## Auto Scaling

_NB_ : this feature requires the metrics server to be deployed (like the `k top` command).

### set autoscaling

`k autoscale deploy <deploy_name> --min=<min_replicas> --max=<replicas> --cpu-percent=<threshold_before_scale>`

> create an nginx deployment, set its cpu limit to 50m

> add autoscaling to deployment max 3 replicas and a starting scaling when CPU reaches 10%

> check the resource create (`hpa`)

> watch the deployment

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

> stop the load test & keep watching the deployment 

the default cooldown" duration is 5', in the mean time, you can have a look at the [documentation](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-multiple-metrics-and-custom-metrics) to learn how to use more advanced settings