#!/bin/bash

apk update
#apk upgrade -y
apk add --no-cache curl bash 
until curl -k https://192.168.56.110:6443; do sleep 1; done
while [ ! -f /home/vagrant/vagrant_data/token ]; do
  sleep 1
done
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 INSTALL_K3S_EXEC="agent --node-ip=192.168.56.111" K3S_TOKEN="$(cat /home/vagrant/vagrant_data/token)" sh -s
