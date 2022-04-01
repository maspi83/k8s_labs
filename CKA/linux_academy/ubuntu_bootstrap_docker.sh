OS_CHECK=$(grep DISTRIB_ID /etc/*-release | cut -d'=' -f2)
if [ "$OS_CHECK" != "Ubuntu" ]; then echo "Sorry this is only for Ubuntu distro's, exiting..." && exit 1; fi

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install -y docker-ce


docker version
if [ "$?" -eq "0" ]; then sudo apt-mark hold docker-ce; else echo "Checking docker installation"; fi
