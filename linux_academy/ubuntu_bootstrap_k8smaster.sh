OS_CHECK=$(grep DISTRIB_ID /etc/*-release | cut -d'=' -f2)
if [ "$OS_CHECK" != "Ubuntu" ]; then echo "Sorry this is only for Ubuntu distro's, exiting..." && exit 1; fi
echo ""
echo -n "K8s Master INIT"
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
echo "K8s Master flannel"
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
