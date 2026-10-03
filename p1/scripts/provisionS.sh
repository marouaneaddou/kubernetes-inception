#!/bin/bash

apk update
#apt-get upgrade -y
apk add --no-cache curl bash
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --node-ip=192.168.56.110 --write-kubeconfig-mode=644" sh -s

while [ ! -f /var/lib/rancher/k3s/server/node-token ]; do
  sleep 1
done

cp /var/lib/rancher/k3s/server/node-token /home/vagrant/vagrant_data/token
chmod 644 /home/vagrant/vagrant_data/token