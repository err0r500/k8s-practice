## let's start 

> create a deployment with nginx image

> which component is missing ? try to start it

<details>
  <summary>hint</summary>
  kube-apiserver is not running
</details>

> look at the logs

> is it complaining about something missing ? try to fix that

<details>
  <summary>hint</summary> 

  it complains `Error: --etcd-servers must be specified`

  start etcd

  use the "advertise client URLs" found in etcd logs 
</details>

> when you think it's fixed, you should be able to create your deployment

[next step](./step01.md)
