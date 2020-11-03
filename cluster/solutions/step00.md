
on master node:

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
Type=simple
ExecStart=kube-apiserver --etcd-servers=http://localhost:2379
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start etcd.service
sudo systemctl start etcd.service
```
