
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

# Application login   : 

<img width="1851" height="901" alt="image" src="https://github.com/user-attachments/assets/2c22f143-1a35-484f-b680-ea6ccfd18b69" />

# Application access   :

using username : admin_vp

password        : admin_vp 

<img width="1877" height="931" alt="image" src="https://github.com/user-attachments/assets/8c7b4638-2ecb-419c-9288-a5ea657e6dcc" />


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

## Monitoring for Hosts 

<img width="1823" height="981" alt="image" src="https://github.com/user-attachments/assets/d358ac8d-6ca6-431f-a9f7-80859d91c31c" />

## Monitoring for Hosts services 

<img width="1863" height="971" alt="image" src="https://github.com/user-attachments/assets/d2ce4158-a9a3-49b6-88ce-03848c9cb7ae" />

# Hint : All VMs, along with their updates, provisioning configurations, and integrations, were completed no more than 2 hours ago :) 
