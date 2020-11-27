# Bootstrap k8s on lab servers  
```
# all all
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/ubuntu_bootstrap_kubetools.sh | bash
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/ubuntu_bootstrap_docker.sh | bash
# on master
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/ubuntu_bootstrap_k8smaster.sh | bash
```
# Commands  
```
kubectl cluster-info
kubectl get no
kubectl get po
kubectl get ns
kubectl get no -A
kubectl get no -n kube-system
```

# Deploy  
```
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/nginx.yml | kubectl create -f -
```
