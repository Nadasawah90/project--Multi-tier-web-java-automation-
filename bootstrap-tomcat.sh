#!/bin/bash

# Install dependencies
sudo yum update -y  
sudo dnf install -y java-11-openjdk java-11-openjdk-devel git maven wget

# Download Tomcat
cd /tmp
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz
tar xzvf apache-tomcat-9.0.75.tar.gz

# Setup Tomcat user and directory
sudo useradd --home-dir /usr/local/tomcat --shell /sbin/nologin tomcat
sudo mkdir -p /usr/local/tomcat
sudo cp -r /tmp/apache-tomcat-9.0.75/* /usr/local/tomcat/
sudo chown -R tomcat:tomcat /usr/local/tomcat

# Create systemd service
cat << 'EOF' | sudo tee /etc/systemd/system/tomcat.service > /dev/null
[Unit]
Description=Tomcat
After=network.target

[Service]
User=tomcat
WorkingDirectory=/usr/local/tomcat
Environment=JRE_HOME=/usr/lib/jvm/jre
Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_HOME=/usr/local/tomcat
Environment=CATALINE_BASE=/usr/local/tomcat
ExecStart=/usr/local/tomcat/bin/catalina.sh run
ExecStop=/usr/local/tomcat/bin/shutdown.sh
SyslogIdentifier=tomcat-%i

[Install]
WantedBy=multi-user.target
EOF

# Start Tomcat
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl enable tomcat

# Clone app and build
cd ~
git clone -b main https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project
vim src/main/resources/application.properties   # manual step or use `sed`
sudo systemctl stop tomcat
sudo mvn install

# Deploy WAR
sudo rm -rf /usr/local/tomcat/webapps/ROOT*
sudo cp target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
sudo chown -R tomcat:tomcat /usr/local/tomcat/webapps

# Remove Java 17 if exists
sudo yum remove -y java-17-openjdk*

# Start Tomcat
sudo systemctl restart tomcat