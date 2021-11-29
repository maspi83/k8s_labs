## network details
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
