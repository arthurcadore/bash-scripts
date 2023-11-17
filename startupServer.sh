#!/bin/bash
# Author: Arthur Cadore M. Barcella

# Update and Upgrade package list: 
sudo apt-get update && sudo apt-get upgrade -y  

apt-get install fping tree arping net-tools vlan htop unzip qemu-guest-agent netstat -y

# Enable capture on hardware devices for non-root users: 
sudo setcap cap_net_raw,cap_net_admin+eip /usr/bin/tcpdump	

apt-get install zabbix-agent -y 

sudo systemctl start zabbix-agent.service && sudo systemctl status zabbix-agent.service 
sudo systemctl enable zabbix-agent.service
sudo systemctl enable qemu-guest-agent

git config --global user.name arthurcadore 
git config --global user.email arthurbarcella.ifsc@gmail.com

# Salvando as credenciais no chaveiro do S.O. Linux (Ubuntu 22.04)
git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret

sudo cp ./zabbix/zabbix.conf /etc/zabbix/zabbix_agent.conf
sudo systemctl restart  zabbix-agent.service

sudo ufw enable 
sudo ufw allow 22
sudo ufw allow 3306
sudo ufw allow 10050
