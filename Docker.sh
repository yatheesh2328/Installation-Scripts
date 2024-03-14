#!/bin/bash
#Step 1(To remove the docker if exist)
apt-get purge docker-ce docker-ce-cli containerd.io -y
apt-get autoremove -y
sleep 5

sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce
sudo chmod 777 /var/run/docker.sock

echo "DDOCKER INSTALLED SUCCESSFULLY"

#use sudo ./docker.sh 
