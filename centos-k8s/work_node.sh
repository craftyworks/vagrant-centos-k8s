#!/usr/bin/env bash

# config for work_nodes only
NO_PROXY=192.168.0.0/16,10.96.0.0/16,127.0.0.1,localhost kubeadm join --token 123456.1234567890123456 \
--discovery-token-unsafe-skip-ca-verification 192.168.1.10:6443

