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

  # Run commands with sudo
  sudo apt update
  sudo apt install squid

EOF

done < servers.txt
