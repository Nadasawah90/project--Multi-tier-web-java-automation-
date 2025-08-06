#!/bin/bash

# Install updates 
sudo yum update -y  
sudo yum groupinstall "development tools" -y
sudo yum install httpd php php-cli gcc unzip wget glibc glibc-common gd gd-devel net-snmp -y 

#Install Required Dependencies
sudo useradd nagios 
sudo groupadd nagcmd 
sudo usermod -a -G nagcmd nagios 
sudo usermod -a -G nagcmd apache

# Download Nagios Core
wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.5.9.tar.gz 
tar xzf nagios-4.5.9.tar.gz 

#Compile Nagios Core
cd nagios-4.5.9
./configure --with-command-group=nagios
make all

#Install Nagios Core
sudo make install 
sudo make install-commandmode 
sudo make install-init 
sudo make install-config 
sudo make install-webconf 

#Install Nagios Plugins
wget http://nagios-plugins.org/download/nagios-plugins-2.4.9.tar.gz 
sudo tar xzf nagios-plugins-2.4.9.tar.gz 
cd nagios-plugins-2.4.9
sudo ./configure --with-nagios-user=nagios --with-nagios-group=nagcmd 
sudo make 
sudo make install

echo "P@ssw0rd" | sudo htpasswd -c -i /usr/local/nagios/etc/htpasswd.users nagiosadmin

sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg 
sudo systemctl enable nagios 
sudo systemctl start nagios
sudo systemctl start httpd 
sudo systemctl restart httpd 
cat << 'EOF' | sudo /usr/local/nagios/etc/objects/hosts.cfg > /dev/null

define host {

    use                     linux-server

    host_name       db01

    alias           db01

    address          192.168.56.15

}


define host {

    use                     linux-server

    host_name      mc01

    alias           mc01

    address           192.168.56.14

}

define host {

    use                   linux-server

    host_name      rmq01

    alias           rmq01

    address           192.168.56.13

}

define host {

    use                   linux-server

    host_name      app01

    alias           app01

    address          192.168.56.12

}
define host {

    use                   linux-server

    host_name      web01

    alias           web01

    address          192.168.56.11

}

EOF

cat << 'EOF' | sudo /usr/local/nagios/etc/objects/services.cfg > /dev/null

define service {

    use                     generic-service           ; Name of service template to use
    host_name               db01
    service_description     HTTP
    check_command           check_http
    notifications_enabled   0
}

define service {

    use                     generic-service           ; Name of service template to use
    host_name               app01
    service_description     HTTP
    check_command           check_http
    notifications_enabled   0
}

define service {

    use                     generic-service           ; Name of service template to use
    host_name               web01
    service_description     HTTP
    check_command           check_http
    notifications_enabled   0
}


define service {
    use                     generic-service           ; Name of service template to use
    host_name               db01
    service_description     SSH
    check_command           check_ssh
    notifications_enabled   0
}

define service {
    use                     generic-service           ; Name of service template to use
    host_name               web01
    service_description     SSH
    check_command           check_ssh
    notifications_enabled   0
}



EOF

sudo chown nagios:nagios /usr/local/nagios/etc/objects/hosts.cfg
sudo chown nagios:nagios /usr/local/nagios/etc/objects/services.cfg
# Define the folder and file
TARGET_FOLDER="/usr/local/nagios/etc"
TARGET_FILE="nagios.cfg"
FULL_PATH="$TARGET_FOLDER/$TARGET_FILE"

# Define the section marker and the line to add
SECTION_MARKER="#You can specify individual object config files as shown below:"
LINE1="cfg_file=/usr/local/nagios/etc/objects/hosts.cfg"
LINE2="cfg_file=/usr/local/nagios/etc/objects/services.cfg"

if [ -f "$FULL_PATH" ]; then
  # Insert both lines after the section marker
 sudo sed -i "/$SECTION_MARKER/a $LINE1" "$FULL_PATH"
 sudo sed -i "/$SECTION_MARKER/a $LINE2" "$FULL_PATH"
  echo "Lines added successfully to $FULL_PATH."
else
  echo "File $FULL_PATH does not exist."
fi




sudo nagios -v /usr/local/nagios/etc/nagios.cfg

sudo systemctl restart nagios

