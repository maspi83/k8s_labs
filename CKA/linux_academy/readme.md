# Bootstrap k8s on lab servers  
```
## ubuntu
# all all
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/ubuntu_bootstrap_kubetools.sh | bash
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/ubuntu_bootstrap_docker.sh | bash
# on master
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/ubuntu_bootstrap_k8smaster.sh | bash

## basic centos 7 master bootstrap
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/centos7_bootstrap_AIO.sh | bash
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
# first thing
alias k="kubectl"

k cluster-info
k get no
k get po
k get ns
k get no -A
k get no -n kube-system
k get po
k describe po POD_NAME
k describe no NODE_NAME

k exec busybox -- curl TARGET_POD_ID # get from kubectl get pods -o wide 

k config current-context
k config get-contexts
k config set-context --current --namespace=kube-system

k delete po POD_NAME
k delete --all pods # watch out whats your namespace or use -n just for sure

k logs POD_NAME
k logs POD_NAME -c CONTAINER_NAME # in case of mutliple containers
```

# Playing with Pods, deployments, ns and so on...  
```
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/nginx_pod.yml | kubectl create -f -
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/busybox_pod.yml | kubectl create -f -
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/nginx_deployment.yml | kubectl create -f -
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/linux_academy/nginx_store.yml | kubectl create -f -
```
