Like a replicaset (which it uses under the hood) with a notion of history and transitions between them

## manifest

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deploy
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    <pod_spec>
```

you can use the `k create <resource_type> <resource_name> -o <output_format> --dry-run=client` command to output a manifest

> using this comand, generate a basic deployment manifest file

> update it so it runs 2 nginx pods & apply it

## Roll...

- _Rollout_ : triggered iff the Deployment's Pod template is changed (ex: change container image: yes, scaling: no), every new rollout is added to the rollout history
- _Rollover_ : update a Deployment while an existing rollout is in progress, it doesn't wait for the previous rollout to complete before starting the new one.
- _Rollback_ : back to a rollout 

### the rollout command

> run the following commands : 

- `k rollout status`
- `k rollout history deploy <deployment_name>`
- update the container image to `nginx:latest` 
- `k rollout history deploy <deployment_name>`
- update replica count to `3` 
- `k rollout history deploy <deployment_name>`
- `k rollout history deploy <deployment_name> --revision <revision_number>`
- update the container image to `nginx:bla` 
- `k rollout undo deploy <deployment_name>`
- `k rollout undo deploy <deployment_name>` back to bla ! :( 
- `k rollout undo deploy <deployment_name> --revision 1`  (still in history ?)

## Strategy:

set at `.spec.strategy.type`

- "Recreate" : every existing pods will be killed before new ones are created 
- "RollingUpdate" (default) : le déploiement met à jour les pods de maniere continue :
    Les options si dessous s'entendent par rapport au déploiement déjà en place et peuvent etre exprimé en nombre absolu ou en % (les 2 ne peuvent etre a 0, par defaut : 25% chacun)
    -   maxUnavailable : nombre max de pods indispos : en kill n de l'ancien déploiement directement pendant qu'il deploie les nouveaux
    -   maxSurge : nombre max de pods en plus (si l'ancien replicaset est a 10 et 40% indiqué, il pourra y avoir 14 pods ups en meme temps)

> set to `Recreate` and upate the nginx image

> check your pods

[service](./service.md)
