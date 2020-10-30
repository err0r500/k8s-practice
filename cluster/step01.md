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

> complaining about something else ? 

this one is tricky, it needs you to pass the path of an encryption key to generate tokens

> create the key, and fix the component

<details>
  <summary>hint</summary> 

  ```
  ssh-keygen -t ecdsa -m pem -f ./kcm
  kube-controller-manager --master=http://localhost:8080 --service-account-private-key-file=<path_to_private_key>
  ```

</details>