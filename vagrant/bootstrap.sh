#!/usr/bin/env bash   
sudo apt-get update
echo "installing apt repo for docker"
apt-get install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
apt-get update
echo "installing packages"
sudo apt-get install -y git unzip python-pip docker-engine
sudo pip install docker-compose
git clone https://github.com/PerseusDL/capitains-environment
echo "Enabling ubuntu user to run docker"
sudo usermod -aG docker ubuntu
