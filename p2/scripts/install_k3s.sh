apt-get update 
#apt-get upgrade -y
apt-get install curl -y
mkdir -p /home/vagrant/.kube
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --node-ip=192.168.56.110 --write-kubeconfig  /home/vagrant/.kube/config --write-kubeconfig-mode=644" sh -s
echo "k3s installed successfully"
while [ ! -f /var/lib/rancher/k3s/server/node-token ]; do
  sleep 1
done
echo "192.168.56.110 app1.com" | sudo tee -a "/etc/hosts"
echo "192.168.56.110 app2.com" | sudo tee -a "/etc/hosts"
echo "192.168.56.110 app3.com" | sudo tee -a "/etc/hosts"
systemctl restart k3s