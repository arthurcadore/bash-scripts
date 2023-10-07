#!/bin/bash
# Author: Arthur Cadore M. Barcella

# Update and Upgrade package list: 
sudo apt-get update && sudo apt-get upgrade -y  

apt-get install -y fping tree arping net-tools vlan zabbix-agent htop unzip qemu-guest-agent

# Enable capture on hardware devices for non-root users: 
sudo setcap cap_net_raw,cap_net_admin+eip /usr/bin/tcpdump	

sudo systemctl start zabbix-agent && sudo systemctl status zabbix-agent 
sudo systemctl enable zabbix-agent 
sudo systemctl enable qemu-guest-agent

git config --global user.name arthurcadore 
git config --global user.email arthurbarcella.ifsc@gmail.com

# Salvando as credenciais no chaveiro do S.O. Linux (Ubuntu 22.04)
git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret

