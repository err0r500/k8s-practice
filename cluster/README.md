# Let's build a cluster from scratch 

NB : it's very inspired from this talk : [LISA19 - Deep Dive into Kubernetes Internals for Builders and Operators](https://www.youtube.com/watch?v=3KtEAa7_duA)

We'll first attempt to create a deployment and fix the cluster in order to progress

__currently, no kubernetes component is running on the VM__

We'll use systemd because a lot of components will be running

## useful commands
- you must put files in `/etc/systemd/system/
- reload your services : `systemctl daemon-reload`
- start|stop|restart|get status of a service : `systemctl start|stop|restart|status <file_name>`
- get more details `journalctl -u <service_name>` (use the `-f` flag to follow the logs)


basic service template
```
[Service]
Type=simple
ExecStart=<the_command_to_run>

Restart=on-failure

[Install]
WantedBy=multi-user.target

```

> log into your master node

```
  ssh -i <path_to_key> -J ubuntu@<bastion_ip> ubuntu@master.k8s.lab
```

[next step](./step00.md)