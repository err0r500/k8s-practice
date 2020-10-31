
> what is missing to a replicaset in order to become READY ?

In order to get this missing resource, we need a component able to pick where it will be scheduled : the kube-scheduler

> start the kube-scheduler

<details>
  <summary>hint</summary> 

  ```
  kube-scheduler --master=http://localhost:8080
  ```

</details>

> what is it complaining about ? 

<details>
  <summary>hint</summary> 

  it doesn't find any node, so it's pretty much working, you just have an empty cluster

</details>

[next step](./step03.md)
