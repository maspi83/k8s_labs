OS_CHECK=$(grep DISTRIB_ID /etc/*-release | cut -d'=' -f2)
if [ "$OS_CHECK" != "Ubuntu" ]; then echo "Sorry this is only for Ubuntu distro's, exiting..." && exit 1; fi

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update

sudo apt-get install -y kubelet=1.15.7-00 kubeadm=1.15.7-00 kubectl=1.15.7-00

kubeadm version
if [ "$?" -eq "0" ]; then sudo apt-mark hold kubelet kubeadm kubectl; else echo "Checking kubetools installation"; fi

echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

echo "Installing kubens and kubectx"
wget -q https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubens -O /usr/bin/kubens && chmod 755 /usr/bin/kubens
wget -q https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubectx -O /usr/bin/kubectx && chmod 755 /usr/bin/kubectx
