## let's start 

> create a deployment with nginx image

> which component is missing ? try to start it

<details>
  <summary>hint</summary>
  kube-apiserver is not running
</details>

> look at the logs

> is it complaining about something missing ? try to fix that

<details>
  <summary>hint</summary> 

  it complains `Error: --etcd-servers must be specified`

  start etcd

  use the "advertise client URLs" found in etcd logs 
</details>

> when you think it's fixed, you should be able to create your deployment (not READY)

[next step](./step01.md)


```
cat <<EOF | sudo tee /etc/systemd/system/etcd.service
[Service]
Type=notify
ExecStart=etcd

Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

cat <<EOF | sudo tee /etc/systemd/system/kube-apiserver.service
[Service]
Type=notify
ExecStart=kube-apiserver --etcd-servers=http://localhost:2379
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start etcd.service
sudo systemctl start kube-apiserver.service
```
