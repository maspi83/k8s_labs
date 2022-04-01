
Sources: [David VTUK](https://github.com/David-VTUK/CKA-StudyGuide)
## create sa + role + rolebinding + test it
```
kubectl create namespace rbac
kubectl config set-context --current --namespace=rbac
kubectl create sa job-inspector
kubectl create role job-inspector --verb=get --verb=list --resource=jobs
kubectl create rolebinding permit-job-inspector --role=job-inspector --serviceaccount=job-inspector
kubectl --as job-inspector auth can-i get job # OK
kubectl --as job-inspector auth can-i get deployment # NOK
```

## upgrade k8s cluster
```
apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

sudo kubeadm init --pod-network-cidr=10.244.0.0/16
...
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
...
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
...
Note the join command, ie:
kubeadm join 172.16.10.210:6443 --token 9tjntl.10plpxqy85g8a0ui \
    --discovery-token-ca-cert-hash sha256:381165c9a9f19a123bd0fee36fe36d15e918062dcc94711ff5b286ee1f86b92b 

kubeadm join 172.16.10.210:6443 --token 9tjntl.10plpxqy85g8a0ui \
    --discovery-token-ca-cert-hash sha256:381165c9a9f19a123bd0fee36fe36d15e918062dcc94711ff5b286ee1f86b92b 


```

## etcd backup
```
# get params from /etc/kubernetes/manifest/etcd.yaml

ETCDCTL_API=3 etcdctl snapshot save snapshot.db --endpoints=*:2379 --cacert /etc/kubernetes/pki/etcd/server.crt --cert /etc/kubernetes/pki/etcd/ca.crt --key /etc/kubernetes/pki/etcd/ca.key
```

## update deployment parts
```
kubectl create deployment nginx --image=nginx:1.19.5 --replicas=6
kubectl set image deployment nginx nginx=nginx:1.19.6 --record=true
kubectl get deployment nginx -o yaml > nginx_deployment.yaml
kubectl patch deployments.apps nginx --patch-file=deplo.yaml
```
## Use CM, 
source: 
[link](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)
[link](https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/memory-default-namespace/)
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx-configmap
spec:
  containers:
    - name: nginx-configmap
      image: nginx
      command: [ "/bin/sh", "-c", "env" ]
      env:
        - name: OWNER
          valueFrom:
            configMapKeyRef: or secretKeyRef:
              name: mycm
              key: owner

kubectl logs nginx-configmap | grep OWNER
```

## Limits, source: [link](https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/cpu-constraint-namespace/)
```
```