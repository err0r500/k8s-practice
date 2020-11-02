> curl a pod running on another node 

Damn ! :)

Let's fix this network ! 

We'll try to fix it in the worker (W) -> master (M) direction first.

pick the IP of an nginx pod running on W

we force the scheduling on M and will try to ping it from W

try to ping it from the W (then open a new terminal to do the debug)

> the traffic should go from a maching to another in AWS network (192.168.0.0/16), does it take the right interface on W ? why ?

<details>
  <summary>hint</summary> 

  this interface is named ens5, we can check that with :

  ```
  sudo tcpdump -i ens5 -c5 icmp
  ```

  you should see some traffic, perfect

  ```
  sudo ip route
  ```

</details>

> why ? 

<details>
  <summary>hint</summary> 

  ```
  ip route
  ```

  ens5 is the default, so it just routes the traffic there because it doesn't know what to do with it and sends it to the default gateway

</details>

> is it able to reach M on the same network ?

<details>
  <summary>hint</summary> 

  ```
  sudo tcpdump -i ens5 -c5 icmp
  ```

  we don't see any traffic

</details>

> why ? fix it 

<details>
  <summary>hint</summary> 

  M is not the default gateway of W (which sends to the router, not M)

  We don't want to change the default gateway (you don't want a request to google.com to end up on M)

  we must ask to route the traffic to 10.0.0.0/24 to M

  ```
  sudo ip route add 10.0.0.0/24 via <master_aws_ip>
  ```
  

  NB : aws ec2 eni must have the flag  `source_dest_check = false`

</details>

 you should now see packets reaching M !

> check the destination IP reaching ens5, is it in ens5 network ?

> what is the next hop to the pod ? is it reached ?

<details>
  <summary>hint</summary> 

  ```
  sudo tcpdump -i cnio0 -c5 icmp
  ```

  we don't see any traffic

</details>

> why ? fix it !

<details>
  <summary>hint</summary> 

  IP forwarding describes exactly the job of a router : take packets reaching an interface with a dest IP not in nic network and forward it to another interface in the dest network  

  first it may not be enabled on your kernel, this can be fixed with

  ```
  sudo sysctl net.ipv4.conf.all.forwarding=1
  ```

  we don't see any traffic yet... it's because it's not allowed yet to foward traffic reaching `ens5` with dest in `cnio0` network to `cnio0`

  ```
  sudo iptables -A FORWARD -i ens5 -o cnio0 -j ACCEPT 
  ```

</details>


 you should now see packets reaching cnio0 on M !

> do you have responses to your pings ? why ? fix it.

<details>
  <summary>hint</summary> 

  because in order to reply, traffic to ens5 (the IP of W) will reach cnio0. this forwarding must be allowed too

  ```
  sudo iptables -A FORWARD -i cnio0 -o ens5 -j ACCEPT 
  ```

</details>

 you should even have replies to your pings ! 

> curl an nginx pod on master

See the welcome message ? Success !

Do the same thing to allow traffic from M -> W

When it works, head over the [next section](./step08.md)

