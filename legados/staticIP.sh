#!/bin/bash

# Author: Arthur Cadore M. Barcella
# Gihub: arthurcadore

# Code: Set static IP address for interface on Ubuntu 22.04/20.04/18.04/16.04.
# The script works editing the main interface network files.

# Get configuration parameters by the user:

# Interface name
# Print interface list to user:
echo "Interface name List:"
ip -br link show

# Get interface name by user:
echo "Enter interface name (string): "
read interface

# Get IP address
echo "Enter IP address (example -> 10.0.0.10): "
read ip_address

# Get gateway address
echo "Enter gateway address (example -> 10.0.0.1): "
read gateway

# Get subnet mask
echo "Enter subnet mask (example -> 24): "
read subnet_mask

# Get DNS server address
echo "Enter DNS server address: "
read dns_server

# Get system version (cat /etc/os-release);

version=$(cat /etc/os-release | grep VERSION_ID | cut -d '"' -f 2)

version0="16.04"
version1="18.04"
version2="20.04"
version3="22.04"

# Check system version and configure interface:

# if version is 18.04, configure interface using netplan 18.04.
# if its not, configure interface using netplan 22.04.

if [ "$version" == "$version1" ]; then
  echo "Ubuntu 18.04"

  # Configure interface using netplan (Ubuntu 18.04)
  sudo echo "network:
      version: 2
      renderer: networkd
      ethernets:
        $interface:
          dhcp4:  
          addresses: [$ip_address/$subnet_mask]
          gateway4: $gateway
          nameservers:
            addresses: [$dns_server]" >/etc/netplan/01-netcfg.yaml

  # Apply changes
  netplan apply

else
  echo "Ubuntu 22.04"

  # configure interface using netplan (Ubuntu 22.04)
  sudo echo "network:
      version: 2
      renderer: networkd
      ethernets:
        $interface:
          dhcp4: no
          addresses: [$ip_address/$subnet_mask]
          gateway4: $gateway
          nameservers:
            addresses: [$dns_server]" >/etc/netplan/00-installer-config.yaml

  # Apply changes
  netplan apply

  # Resumo das configs:
  echo "IP address:"
  ip addr show $interface | grep inet

  echo "Gateway address:"
  ip route show | grep default

  echo "DNS addresses:"
  resolvectl status | grep Server

fi
