## labels

labels are maps (key:value) allowing you to set logical grouping of your resources, you can add any number of labels to any resource metadata

```yaml
metadata:
  labels:
    env: test
    tier: frontend 
```

## selector

a selector is used when a resource needs to refer to other ones.

the most used selector is `matchLabels` which is a map. 

it matches a resource if this one has (at least) all the labels of the selector

```yaml
matchLabels:
  tier: frontend 
```
for instance the selector above will match the labels above

```yaml
matchLabels:
  tier: frontend 
  other: foo
```

this one won't

We will see selectors in action in the next section

## annotations

annotations can be set in `metadata.annotations` of a resource

they are used for documentation purpose or for tools external to k8s itself

> add the annotation release=<today>

[replicaset](./replicaset.md)
