```
# get logs
kubectl logs POD | grep "access" > /tmp/file.txt

# check nodes - look for status
kubectl describe no node01 

# top
kubectl top nodes --sort byt cpu
kubectl top nodes --sort byt memory

# systemctl kubelet, docker
journal -xe -u kubelet
systemctl status kubelet
systemctl start kubelet
systemctl enable kubelet

journal -xe -u docker
systemctl status docker
systemctl start docker
systemctl enable docker

kubectl get componentstatus
kubectl get clusterinfo

# check -n kube-system, when issue with scheduling and other
control-manager, scheduler

#  ports and protocl
https://kubernetes.io/docs/reference/ports-and-protocols/

```