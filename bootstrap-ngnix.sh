#!/bin/sh

# Install Tomcat 
sudo apt update 
sudo apt upgrade
sudo apt install nginx -y


cat << 'EOF' | sudo  tee /etc/nginx/sites-available/vproapp > /dev/null
upstream vproapp {
 server app01:8080;
}
server {
  listen 80;
location / {
  proxy_pass http://vproapp;
  }
  }

EOF

sudo rm -rf /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/vproapp /etc/nginx/sites-enabled/vproapp
sudo systemctl restart nginx
