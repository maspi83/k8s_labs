```
# Drain
k drain node01 --ignore-daemonsets      

# Maitenance
drain - unschedule + remove all running pods
uncordon, cordon -  enable|disable scheduling, 

kubeadm  upgrade plan

apt update
apt-cache madison kubeadm
apt-get update && apt-get install -y kubeadm=1.20.0-00
apt-mark hold kubeadm
kubeadm upgrade plan
kubeadm upgrade apply v1.20.0

apt-get update && apt-get install -y kubelet=1.20.0-00 kubectl=1.20.0-00
sudo systemctl daemon-reload
systemctl restart kubelet
kubectl uncordon
kubectl uncordon controlplane 

# Check /etc/kubernetes/manifests/etcd, /etc/kubernetes/pki
ETCDCTL_API=3 etcdctl snapshot save /opt/snapshot-pre-boot.db --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key --cacert=/etc/kubernetes/pki/etcd/ca.crt --endpoints=https://127.0.0.1:2379,https://10.32.95.3:2379
Snapshot saved at /opt/snapshot-pre-boot.db
```