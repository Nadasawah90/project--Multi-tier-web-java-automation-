# project--Multi-tier-web-java-automation-provision-Microservices#
<img width="2048" height="1302" alt="image" src="https://github.com/user-attachments/assets/1b1fffa9-e320-4c07-bbaf-7162d1a43c71" />

<img width="1851" height="901" alt="image" src="https://github.com/user-attachments/assets/2c22f143-1a35-484f-b680-ea6ccfd18b69" />

PROVISIONING
Services
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
