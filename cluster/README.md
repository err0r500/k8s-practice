# Let's build a cluster from scratch 

NB : it's very inspired from this talk : [LISA19 - Deep Dive into Kubernetes Internals for Builders and Operators](https://www.youtube.com/watch?v=3KtEAa7_duA)

We'll first attempt to create a deployment and fix the cluster in order to progress

> log into your master node

<details>
  <summary>OpenSSH</summary>

  ```sh
    ssh -i <path_to_key> -J ubuntu@<bastion_ip> ubuntu@master.k8s.lab
  ```
</details>