## manifest

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: game-demo
data:
  # property-like keys; each key maps to a simple value
  player_initial_lives: "1000"
  ui_properties_file_name: "user-interface.properties"

  # file-like keys
  game.properties: |
    enemy.types=aliens,monsters
    player.maximum-lives=5
  user-interface.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=true
```

TODO : do the cm file as an exercise

## use a configMap
There are four different ways that you can use a ConfigMap to configure a container inside a Pod:

- Command line arguments to the entrypoint of a container
- Environment variables for a container
- Add a file in read-only volume, for the application to read
- Write code to run inside the Pod that uses the Kubernetes API to read a ConfigMap (not seen)

For the first 3 methods, the kubelet uses the data from the ConfigMap when it launches container(s) for a Pod.
The fourth method means you have to write code to read the ConfigMap and its data. 
However, because you're using the Kubernetes API directly, your application can subscribe to get updates whenever the ConfigMap changes. This also lets you access a ConfigMap in a different namespace.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: configmap-demo-pod
spec:
  containers:
    - name: demo
      image: busybox
      command: ["sleep", "$(MY_PLAYER_INITIAL_LIVES)"]
      env:
        - name: MY_PLAYER_INITIAL_LIVES 
          valueFrom:
            configMapKeyRef:
              name: game-demo           # The ConfigMap this value comes from.
              key: player_initial_lives # The key to fetch.
        - name: UI_PROPERTIES_FILE_NAME
          valueFrom:
            configMapKeyRef:
              name: game-demo
              key: ui_properties_file_name
      volumeMounts:
      - name: config
        mountPath: "/config"
        readOnly: true
  volumes:
    - name: config
      configMap:
        name: game-demo # Provide the name of the ConfigMap you want to mount.
        items:
        - key: "game.properties"
          path: "my-game.properties" 
        - key: "user-interface.properties"
          path: "user-interface"
        - key: "test"
          path: "player_initial_lives"
```


> apply the configMap 

> retrieve its content

> edit its content