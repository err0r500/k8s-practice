> check your pods 

A dedicated process has the responsability to assign pods to nodes : the kube-scheduler

> start the kube-scheduler

<details>
  <summary>hint</summary> 

  ```
  kube-scheduler --master=http://localhost:8080
  ```

</details>

Everything should be working by now ! 

> curl the nginx pod

If you have the welcome message, Congratulations !

[next step](./step04.md)
