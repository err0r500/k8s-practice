#!/bin/bash

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: salut
  labels:
    tier: storage
spec:
  containers:
  - name: tester
    image: busybox
    args:
    - sleep
    - "1000000"
  - name: storage
    image: redis:latest
EOF