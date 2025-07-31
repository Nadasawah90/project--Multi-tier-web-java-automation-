Vagrant-web-java-automation-provision-Microservices

Architecture Design for the project : 
 
<img width="2048" height="1302" alt="image" src="https://github.com/user-attachments/assets/1b1fffa9-e320-4c07-bbaf-7162d1a43c71" />


Prerequiests : 

1. Oracle VM Virtualbox
2. Vagrant
3. Vagrant plugins
Execute below command in your computer to install hostmanager plugin
$ vagrant plugin install vagrant-hostmanager

We need 5 VMs to provision the belwo services : 

1. Nginx => Web Service
2. Tomcat => Application Server
3. RabbitMQ => Broker/Queuing Agent
4. Memcache => DB Caching
5. ElasticSearch => Indexing/Search service
6. MySQL => SQL Database
Setup should be done in below mentioned order
MySQL (Database SVC)
Memcache (DB Caching SVC)
RabbitMQ (Broker/Queue SVC)
Tomcat (Application SVC)
Nginx (Web SVC)

Result : 

<img width="1851" height="901" alt="image" src="https://github.com/user-attachments/assets/2c22f143-1a35-484f-b680-ea6ccfd18b69" />

using username : admin_vp

password        : admin_vp 

<img width="1877" height="931" alt="image" src="https://github.com/user-attachments/assets/8c7b4638-2ecb-419c-9288-a5ea657e6dcc" />



Exporting all VMs to vagrant cloud using : 
vagrant package mc01 --output mc01.box
vagrant package db01 --output db01.box
vagrant package app01 --output app01.box

<img width="850" height="185" alt="image" src="https://github.com/user-attachments/assets/3136415f-a637-45b4-81df-11da62c4c913" />

and ..... so on then connect to vagrant registry and create new registry and upload mc01.box , db01.box,....etc

<img width="1477" height="656" alt="image" src="https://github.com/user-attachments/assets/bd5977a4-8076-493f-aafc-b2b23d2d5950" />


