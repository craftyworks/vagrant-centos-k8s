#!/usr/bin/env bash

# yum repo
#sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Base.repo
#sed -i 's/#baseurl/baseurl/g' /etc/yum.repos.d/CentOS-Base.repo
#sed -i 's/centos\.org/kakao\.com/g' /etc/yum.repos.d/CentOS-Base.repo
#sed -i 's/enabled=1/enabled=0/g' /etc/yum/pluginconf.d/fastestmirror.conf


# install packages
yum install epel-release -y
yum install vim-enhanced -y
yum install git -y

# install k8s cluster
yum install kubectl-$1 kubelet-$1 kubeadm-$1 -y
systemctl enable --now kubelet

# install docker manually
# yum update
# yum install docker -y && systemctl enable --now docker
# cat <<EOF >> /etc/sysconfig/docker
# HTTP_PROXY="http://70.10.15.10:8080"
# HTTPS_PROXY="http://70.10.15.10:8080"
# NO_PROXY="localhost,127.0.0.1,70.,192.168.,redii.net,*.redii.net"
# EOF

# git clone
if [ $2 = 'Main' ]; then
  git clone https://github.com/sysnet4admin/_Book_k8sInfra.git
  mv /home/vagrant/_Book_k8sInfra $HOME
  find $HOME/_Book_k8sInfra/ -regex ".*\/\(sh\)" -exec chmod 700 {} \;
fi
