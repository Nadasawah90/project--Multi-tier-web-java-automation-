#!/bin/sh

# Install memcached
sudo yum update -y  
sudo dnf install memcached -y
sudo systemctl start memcached
sudo systemctl enable memcached
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/sysconfig/memcached
sudo systemctl restart memcached

