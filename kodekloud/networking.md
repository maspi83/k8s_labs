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
