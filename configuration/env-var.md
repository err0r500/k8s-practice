you can set environment variables to your pods spec :

```
apiVersion: v1
kind: Pod
metadata:
  name: envars-demo
spec:
  containers:
    - name: dummy
      command: ["sleep", "1000"]
      image: busybox
    - name: demo
      command: ["sleep", "1000"]
      image: busybox
      env:
        - name: SERVICE_PORT
          value: "80"
        - name: SERVICE_IP
          value: "172.17.0.1"
        - name: UNCHANGED_REFERENCE
          value: "$(PROTOCOL)://$(SERVICE_IP):$(SERVICE_PORT)"
        - name: PROTOCOL
          value: "https"
        - name: SERVICE_ADDRESS
          value: "$(PROTOCOL)://$(SERVICE_IP):$(SERVICE_PORT)"
        - name: ESCAPED_REFERENCE
          value: "$$(PROTOCOL)://$(SERVICE_IP):$(SERVICE_PORT)"
        - name: MY_POD
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: MY_NODE_NAME
          valueFrom:
            fieldRef:
              fieldPath: spec.nodeName
        - name: MY_MEMORY_LIMIT
          valueFrom:
            resourceFieldRef:
              containerName: demo
              resource: limits.memory
        - name: DUMMY_MEMORY_LIMIT
          valueFrom:
            resourceFieldRef:
              containerName: dummy
              resource: limits.memory
              divisor: 1Mi
```


>>apply the manifest and check the logs of the pod<<
(*)

`SERVICE_ADDRESS` seemed to work as expected.

>>what does UNCHANGED_REFERENCE tells us ? <<
(*)

>>what does ESCAPED_REFERENCE tells us ? <<
(*)

>>what does MY_POD tells us ? <<
(*)

>>what does MY_NODE_NAME tells us ? <<
(*)

>>what does MY_MEMORY_LIMIT tells us ? <<
(*)

>>what does DUMMY_MEMORY_LIMIT tells us ? <<
(*)

