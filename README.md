 ## Architecture Design for the project ##  
 
<img width="2048" height="1302" alt="image" src="https://github.com/user-attachments/assets/1b1fffa9-e320-4c07-bbaf-7162d1a43c71" />


# Prerequiests # 

1. Oracle VM Virtualbox
2. Vagrant
3. Vagrant plugins
## We need 5 VMs to provision the belwo services  : 

1. Nginx => Web Service ((Web SVC))

2. Tomcat => Application Server ((Application SVC))

3. RabbitMQ => Broker/Queuing Agent ((Broker/Queue SVC))
 
5. Memcache => DB Caching ((DB Caching SVC))

6. MySQL => SQL Database ((Database SVC))

### Steps  :

1- Execute below command in your computer to install hostmanager plugin 

$ vagrant plugin install vagrant-hostmanager

2- Execute the belwo command to provisioning the VMs 

$ vagrant up 

$ vagrant  provision 

## Output 

# Application login from Nginx server    : 

<img width="1918" height="978" alt="image" src="https://github.com/user-attachments/assets/06e5be9a-721e-47dd-a0b5-98d86b4e9c65" />


# Application access   :

using username : admin_vp

password        : admin_vp 

<img width="1877" height="931" alt="image" src="https://github.com/user-attachments/assets/8c7b4638-2ecb-419c-9288-a5ea657e6dcc" />

# Testing Cashing server 

<img width="1872" height="655" alt="image" src="https://github.com/user-attachments/assets/0a3d4328-1439-4c05-b8a1-eb18f43e7921" />


## Exporting all VMs to vagrant cloud 

Now we can upload all VMs to virtual vagrant cloud using the belwo commands : 

vagrant package mc01 --output mc01.box

vagrant package db01 --output db01.box

vagrant package app01 --output app01.box

<img width="842" height="255" alt="image" src="https://github.com/user-attachments/assets/5467beab-3075-4aa4-9e74-85b6f58ef132" />


and ..... so on then connect to vagrant registry and create new registry and upload mc01.box , db01.box,....etc


<img width="1862" height="910" alt="image" src="https://github.com/user-attachments/assets/49dda231-0879-489b-ad6c-29899bbe0979" />


<img width="1827" height="878" alt="image" src="https://github.com/user-attachments/assets/f8b9fff1-5ce7-4cea-9d94-ffeb06cb8108" />

# Nagios for monitoring 

Create New VM using also vagrant file to provision nagios application with all configuration which required through bootstrap-nagios.sh 

<img width="1917" height="946" alt="image" src="https://github.com/user-attachments/assets/bd94e637-2297-4154-8667-9ce914320ed0" />

# Finally, verify Nagios Configuration files for any errors

#/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

<img width="482" height="591" alt="image" src="https://github.com/user-attachments/assets/b3f82c8f-727c-4873-b793-ee06ff4c27ec" />

## Monitoring for Hosts 

<img width="1888" height="966" alt="image" src="https://github.com/user-attachments/assets/173d8735-89d5-4999-9358-bcacb4c0b74c" />


## Monitoring for Hosts services 

<img width="1902" height="970" alt="image" src="https://github.com/user-attachments/assets/f3b5a816-6e6c-4195-9994-464b6c9791b5" />



##  Hint : 
### All VMs, along with their updates, provisioning configurations, and integrations, were completed no more than 2 hours ago .
