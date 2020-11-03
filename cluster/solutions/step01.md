
```
ssh-keygen -t ecdsa -m pem -f ./kcm

cat <<EOF | sudo tee /etc/systemd/system/kube-controller-manager.service
[Service]
Type=simple
ExecStart=kube-controller-manager --master=http://localhost:8080 --service-account-private-key-file=$(pwd)/kcm
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start kube-controller-manager.service
```
