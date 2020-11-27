# Bootstrap k8s on lab servers  
```
# all all
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/ubuntu_bootstrap_kubetools.sh | bash
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/ubuntu_bootstrap_docker.sh | bash
# on master
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/ubuntu_bootstrap_k8smaster.sh | bash
```
# Join master
```
kubeadm token list
kubeadm token create --print-join-command
or
kubeadm token generate --> kubeadm token create hp9b0k.1g9tqz8vkf78ucwf --print-join-command 
```

# Commands  
```
kubectl cluster-info
kubectl get no
kubectl get po
kubectl get ns
kubectl get no -A
kubectl get no -n kube-system
kubectl get po
kubectl describe po POD_NAME
kubectl delete po POD_NAME
kubectl describe no NODE_NAME

kubectl exec busybox -- curl TARGET_POD_ID # get from kubectl get pods -o wide 
```

# Deploy  
```
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/nginx.yml | kubectl create -f -
```
