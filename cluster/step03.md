we need to register a node, this is kubelets job

> start it in the terminal, try to spot the problem 

<details>
  <summary>hint</summary> 

  it doesn't find the api-server

</details>

kubelet authenticates against the api-server has anyone else 

your kubectl works because of its default settings, kubelet isn't has smart

using the `k config` command set a config so the kubelet can use it

> you don't have much info about how to fix the connectivity problem, just set what you can.

<details>
  <summary>hint</summary> 

  ```
   k config set-cluster lab --server=http://localhost:8080
   k config set-context lab --cluster=lab
   k config use-context lab
  ```

</details>

> restart the kubelet & check what's running

Everything should be working by now ! 

> curl the nginx pod, you must have the welcome message

Congratulations !

[next step](./step04.md)
