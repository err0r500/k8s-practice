a `service` is an abstract way to expose an application running on a set of `pods` as a network service

Kubernetes gives Pods their own IP addresses and a single DNS name for a set of Pods, and can load-balance across them.

## manifest

```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: MyApp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 9376
```

- selector : list of pods matching the selector
- ports.port: port of the service
- ports.targetPort: port where the network will be routed to (to pods matching the selector)
- type : the type of service (see below)

https://kubernetes.io/docs/concepts/services-networking/service/

## service types

- _ClusterIP_: (default) Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster.
- _NodePort_ : Exposes the Service on each Node's IP at a static port (the NodePort). A ClusterIP Service, to which the NodePort Service routes, is automatically created. You'll be able to contact the NodePort Service, from outside the cluster, by requesting <node_ip>:<node_port>
- _LoadBalancer_ : Exposes the Service externally using a cloud provider's load balancer. It automatically creates the NodePort and ClusterIP Services, to which the external load balancer routes.
- ExternalName : todo

>>create a basic nginx deployment<<
(*) ok

>>expose it with a ClusterIP service on port 8080 (nginx listens on 80)<<
(*) ok

>>curl the service from the host, using podIP:targetPort<<
(*) ok

>>curl the service from the host, using clusterIP:port<<
(*) ok

- create a new pod `k run svc-tester --image=busybox --command -- sleep 10000`{{execute}}
- `exec` into it

>>try to reach the service with the IP address<<
(*) ok

>>same thing, try with the service name<<
(*) ok

>>same thing, try with the service_name.namespace<<
(*) ok

>>exit the pod and try with the service name<<
(*) ok

>>expose a deployment with a NodePort service<<
(*) ok

>>try to reach it from any node using nodeIP:nodePort<<
(*) ok

>>try to reach it from any node using clusterIP:port<<
(*) ok

>>try to reach it to the localhost:nodePort of node<<
(*) ok

## service without selector

```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  ports: 
  - protocol: TCP
    port: 80
    targetPort: 9376
---
apiVersion: v1
kind: Endpoints
metadata:
  name: my-service
subsets:
  - addresses:
      - ip: 192.0.2.42
    ports:
      - port: 9376
```

>>expose google.com as a service<<
(*) ok

>>try to reach it from the host<<
(*) ok

>>same from the svc-tester pod<<
(*) ok