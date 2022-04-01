```
kubeadm upgrade plan
    ...
    [upgrade/versions] Latest stable version: v1.19.16
    ...

https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/

    apt update
    
    apt-mark unhold kubeadm
    apt install kubeadm=1.20.0-00
    apt-mark hold kubeadm

    apt-mark unhold kubelet kubectl
    kubeadm upgrade apply v1.20.0
    apt-mark hold kubelet kubectl

    systemctl restart kubelet

export ETCDCTL_API=3
https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/#backing-up-an-etcd-cluster
https://github.com/etcd-io/website/blob/main/content/en/docs/v3.5/op-guide/recovery.md
```