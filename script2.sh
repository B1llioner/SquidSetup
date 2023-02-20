#!/bin/bash

# Read servers.txt and execute the commands for each server
while read line; do
  # Extract IP address, port number, login, and password from the line
  ip=$(echo $line | cut -d ':' -f 1)
  port=$(echo $line | cut -d ':' -f 2)
  login=$(echo $line | cut -d ':' -f 3)
  password=$(echo $line | cut -d ':' -f 4)

  # SSH command to connect to the remote server and execute the commands with sudo
  sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $login@$ip << EOF

  # Add new ACL and allow access
  sudo sed -i '/http_access allow localhost/ a acl localnet_my src YOUR_IP_ADDRESS\nhttp_access allow localnet_my' /etc/squid/squid.conf

  sudo ufw allow 3128

  # Restart Squid service to apply changes
  sudo systemctl restart squid
EOF

done < servers.txt
