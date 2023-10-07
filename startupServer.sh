#!/bin/bash
# Author: Arthur Cadore M. Barcella

# Update and Upgrade package list: 
sudo apt-get update && sudo apt-get upgrade -y  

apt-get install -y fping tree arping net-tools vlan zabbix-agent htop unzip qemu-guest-agent

# Enable capture on hardware devices for non-root users: 
sudo setcap cap_net_raw,cap_net_admin+eip /usr/bin/tcpdump	
