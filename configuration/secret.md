A Secret is an object that contains a small amount of sensitive data. 

To use a secret, a Pod needs to reference the secret. A secret can be used with a Pod in three ways:

- As files in a volume mounted on one or more of its containers.
- As container environment variable.
- By the kubelet when pulling images for the Pod.

The name of a Secret object must be a valid DNS subdomain name.

The keys of data and stringData must consist of alphanumeric characters, -, _ or .

Several Pod can reference the same Secret


```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
data:
  username: <base64_username>
  password: <base64_password>
```

Hint : use `echo -n 'my_string' | base64` (we don't want trailing carriage returns, and yes base64)

you can use it in a Pod as a volume :

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
  - name: mypod
    image: busybox
    command: ["sleep", "1000"]
    volumeMounts:
    - name: foo
      mountPath: "/etc/foo"
      readOnly: true
    env:
    - name: SECRET_USERNAME
      valueFrom:
        secretKeyRef:
          name: mysecret
          key: password 
  volumes:
  - name: foo
    secret:
      secretName: mysecret
```

### select which part of the secret is "projected"
```yaml
items:
- key: username
  path: my-group/my-username
```

## permissions
The default file permission is 0644, you can override it using the `volumes[*].secret.defaultMode`

## Using Hashicorp Vault to store secrets
https://learn.hashicorp.com/tutorials/vault/agent-kubernetes

## Secrets and GitOps
https://learnk8s.io/kubernetes-secrets-in-git