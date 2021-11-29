### network details
```
root@controlplane:~# ip addr | grep eth0
19939: eth0@if19940: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default 
    inet 10.59.200.6/24 brd 10.59.200.255 scope global eth0
root@controlplane:~# ipcalc -b 10.59.200.6/24
Address:   10.59.200.6          
Netmask:   255.255.255.0 = 24   
Wildcard:  0.0.0.255            
=>
Network:   10.59.200.0/24       
HostMin:   10.59.200.1          
HostMax:   10.59.200.254        
Broadcast: 10.59.200.255        
Hosts/Net: 254                   Class A, Private Internet

root@controlplane:~# 
```
### weave network ipalloc-range
```
root@controlplane:~# kubectl logs weave-net-8rkbj weave
DEBU: 2021/11/29 21:40:45.079762 [kube-peers] Checking peer "82:f9:c7:e2:8b:66" against list &{[]}
Peer not in list; removing persisted data
INFO: 2021/11/29 21:40:45.452843 Command line options: map[conn-limit:200 datapath:datapath db-prefix:/weavedb/weave-net docker-api: expect-npc:true http-addr:127.0.0.1:6784 ipalloc-init:consensus=0 ipalloc-range:10.50.0.0/16 metrics-addr:0.0.0.0:6782 name:82:f9:c7:e2:8b:66 nickname:controlplane no-dns:true no-masq-local:true port:6783]
INFO: 2021/11/29 21:40:45.452918 
```
### IP range for k8s cluster
```
root@controlplane:~# grep cluster-ip /etc/kubernetes/manifests/kube-apiserver.yaml 
    - --service-cluster-ip-range=10.96.0.0/12
root@controlplane:~# 
```
### Check proxy configuration
```
root@controlplane:~# kubectl logs kube-proxy-5m5pq 
W1129 21:41:00.948965       1 proxier.go:661] Failed to load kernel module ip_vs_wrr with modprobe. You can ignore this message when kube-proxy is running inside container without mounting /lib/modules
W1129 21:41:00.954723       1 proxier.go:661] Failed to load kernel module ip_vs_sh with modprobe. You can ignore this message when kube-proxy is running inside container without mounting /lib/modules
I1129 21:41:01.131972       1 node.go:172] Successfully retrieved node IP: 10.59.200.9
I1129 21:41:01.132046       1 server_others.go:142] kube-proxy node IP is an IPv4 address (10.59.200.9), assume IPv4 operation
W1129 21:41:01.243383       1 server_others.go:578] Unknown proxy mode "", assuming iptables proxy
I1129 21:41:01.350172       1 server_others.go:185] Using iptables Proxier.
```

### check DNS
```
root@controlplane:~# kubectl get po
NAME                                   READY   STATUS    RESTARTS   AGE
coredns-74ff55c5b-4c4qr                1/1     Running   0          13m
coredns-74ff55c5b-w2wzw                1/1     Running   0          13m
etcd-controlplane                      1/1     Running   0          13m
kube-apiserver-controlplane            1/1     Running   0          13m
kube-controller-manager-controlplane   1/1     Running   0          13m
kube-flannel-ds-lc4vx                  1/1     Running   0          13m
kube-proxy-2kpvb                       1/1     Running   0          13m
kube-scheduler-controlplane            1/1     Running   0          13m

NAME       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   14m
root@controlplane:~# 

root@controlplane:~# kubectl describe deployments.apps coredns | grep -A2 Args
    Args:
      -conf
      /etc/coredns/Corefile
```
