```
kubectl get networkpolicies.networking.k8s.io 


root@controlplane:~# kubectl get no -o wide
NAME           STATUS   ROLES                  AGE   VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION   CONTAINER-RUNTIME
controlplane   Ready    control-plane,master   29m   v1.20.0   10.18.45.6    <none>        Ubuntu 18.04.5 LTS   5.4.0-1068-gcp   docker://19.3.0
node01         Ready    <none>                 29m   v1.20.0   10.18.45.9    <none>        Ubuntu 18.04.5 LTS   5.4.0-1068-gcp   docker://19.3.0
root@controlplane:~# p a | grep -B2 10.18.45.6 
bash: p: command not found
root@controlplane:~# ip a | grep -B2 10.18.45.6
10254: eth0@if10255: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default 
    link/ether 02:42:0a:12:2d:06 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 10.18.45.6/24 brd 10.18.45.255 scope global eth0
root@controlplane:~# 

root@controlplane:~# ip route show default
default via 172.25.0.1 dev eth1 

ifconfig -a
ip addr show weave
ip r
ip a
iptables -L -t nat | grep svc_name
/var/log/kube-proxy.log -- check for information

kubectl get nodes -o wide (INTERNAL IP)
ip a | grep -B2 INTERNAL_IP


kubectl logs kube-proxy --> shows iptables ...
kubectl logs wave --> check ipalloc



root@controlplane:~# ip a | grep eth0
3295: eth0@if3296: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default 
    inet 10.25.43.3/24 brd 10.25.43.255 scope global eth0
root@controlplane:~# ipcalc -b 10.25.43.3/24
Address:   10.25.43.3           
Netmask:   255.255.255.0 = 24   
Wildcard:  0.0.0.255            
=>
Network:   10.25.43.0/24        
HostMin:   10.25.43.1           
HostMax:   10.25.43.254         
Broadcast: 10.25.43.255         
Hosts/Net: 254                   Class A, Private Internet

root@controlplane:~# 

root@controlplane:~# cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep range
    - --service-cluster-ip-range=10.96.0.0/12
```