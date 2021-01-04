#!/bin/bash
OS_CHECK=(grep "^ID=" /etc/*-release | cut -d'"' -f2)
IP=$(hostname -i)

if [ "$OS_CHECK" != "centos" ]; then echo "Sorry this is only for centos distro, exiting..." && exit 1; fi
echo ""

systemctl stop firewalld
systemctl disable firewalld
setenforce 0
sed -i "s/^SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
swapoff -a
sed -i 's/.*swap.*/#&/' /etc/fstab

sleep 10

echo "1" > /proc/sys/net/ipv4/ip_forward
cat > /etc/sysctl.d/k8s.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system

sleep 10

yum install -y wget
mkdir /etc/yum.repos.d/bak && mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/bak
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos7_base.repo
wget -O /etc/yum.repos.d/epel.repo http://mirrors.cloud.tencent.com/repo/epel-7.repo
yum clean all && yum makecache

sleep 10

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF

sleep 10

wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo -O /etc/yum.repos.d/docker-ce.repo

sleep 10

yum install -y docker-ce-18.06.1.ce-3.el7
systemctl enable docker && systemctl start docker
docker version

sleep 10

sudo yum install -y  kubectl-1.15.1-0.x86_64 kubelet-1.15.1-0.x86_64 kubeadm-1.15.1-0.x86_64 kubernetes-cni-0.8.7-0.x86_64
systemctl enable kubelet

sleep 10

kubeadm init --kubernetes-version=1.15.0 --apiserver-advertise-address=$IP --image-repository registry.aliyuncs.com/google_containers --service-cidr=10.1.0.0/16 --pod-network-cidr=10.244.0.0/16


mkdir -p /root/.kube
cp /etc/kubernetes/admin.conf /root/.kube/config

sleep 10

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/a70459be0084506e4ec919aa1c114638878db11b/Documentation/kube-flannel.yml

sleep 10

kubectl get nodes -o wide
