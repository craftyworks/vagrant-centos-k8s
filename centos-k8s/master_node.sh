#!/usr/bin/env bash

# init k8s
kubeadm config images pull
NO_PROXY=192.168.0.0/16,10.96.0.0/16,127.0.0.1,localhost kubeadm init --token 123456.1234567890123456 --token-ttl 0 \
--pod-network-cidr=127.16.0.0/16 --apiserver-advertise-address=192.168.1.10

# config for master node only
mkdir -p $HOME/.kube
cp /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

# config for k8s network
kubectl apply -f \
https://raw.githubusercontent.com/sysnet4admin/IaC/master/manifests/172.16_net_calico.yaml



