> get your deployment

> something is missing try to figure out what

<details>
  <summary>hint</summary> 

   kube-api is just the gate, kube-controller-manager is the brain that does all the job

   start kube-controller-manager

</details>

> if it complains, try to find out why 

<details>
  <summary>hint</summary> 
  it complains it doesn't find the "master", it's the kube-api-server endpoint
</details>

using the `-v=8` to the kubectl, you should be able to figure out the value you need

> find the missing part and fix the component

<details>
  <summary>hint</summary> 

  it should be `kube-controller-manager --master=http://localhost:8080`

</details>

> check the resources, if everything went fine, you should see that a replicaset appeared

> get all resources, the replicaset should add the missing pod... does it complains about something else ? 

this one is tricky, it needs you to pass the path of an encryption key to generate tokens

> create the key, and fix the component

<details>
  <summary>hint</summary> 

  ```
  ssh-keygen -t ecdsa -m pem -f <private_key_path>

  kube-controller-manager --master=http://localhost:8080 --service-account-private-key-file=<private_key_path>
  ```

</details>

> check the resources, if everything went fine, you should see that a pod appeared (PENDING)

[next step](./step02.md)
