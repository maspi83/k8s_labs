# k8s_connecting  

## SSH CLI  
```
vagrant ssh node1
sudo -i
kubectl get nodes
```

## WEB 
```
https://$IP:8443
kubectl -n kube-system describe secret `kubectl -n kube-system get secret|grep admin-token|cut -d " " -f1`|grep "token:"|tr -s " "|cut -d " " -f2
```


## Other sources:
https://www.itwonderlab.com/en/installating-kubernetes-dashboard/
https://blog.exxactcorp.com/building-a-kubernetes-cluster-using-vagrant/
https://github.com/rgl/kubernetes-ubuntu-windows-vagrant