#!/bin/bash

# How to use
# 1. Edit below variables.
# 2. Run this script with `sudo`: sudo ./static-ip.sh

# -------------------- #
# Variables
# -------------------- #
interface="eno1"

ip="10.0.10.3/24"
gateway="10.0.10.1"
dns1="223.5.5.5"
dns2="223.6.6.6"

# -------------------- #
# Scripts
# -------------------- #

# Disable cloud-init
touch /etc/cloud/cloud-init.disabled

# Remove netplan configure file created by cloud-init
CLOUD_INIT_CONFIG_FILE="/etc/netplan/50-cloud-init.yaml"
if [[ -f $CLOUD_INIT_CONFIG_FILE ]]; then
  rm $CLOUD_INIT_CONFIG_FILE
fi

# Create a custom network configure file.
cat <<EOF > /etc/netplan/99-custom-network.yaml
network:
  ethernets:
    $interface:
        addresses:
          - $ip
        routes:
          - to: default
            via: $gateway
        nameservers:
          addresses:
            - $dns1
            - $dns2
        optional: true
EOF

# Set permissions of yaml.
chmod 600 /etc/netplan/99-custom-network.yaml

# Apply settings.
netplan apply
