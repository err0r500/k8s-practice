## Auto Scaling

### Initial setup
`k create deploy nginx-deploy --image=nginx`{{execute}}
`k expose deploy nginx-deploy --port=80`{{exexute}}

### set autoscaling
`k autoscale deploy nginx-deploy --min=1 --max=3 --cpu-percent=80`

### generate load
`k run -it load-gen --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- nginx-deploy; done"`{{execute}}

