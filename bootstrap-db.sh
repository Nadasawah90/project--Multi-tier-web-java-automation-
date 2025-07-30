#!/bin/sh

# Install my SQL
sudo yum update -y  
sudo yum install git mariadb-server -y
sudo systemctl start Mariadb.service
sudo systemctl enable mariadb.service

# Set variables
#!/bin/bash

# Set MySQL root password as variable (not using sudo here)


# Execute MySQL secure setup and DB/user creation
MYSQL_ROOT_PASSWORD="admin123"
DB_NAME="accounts"
DB_USER="root"

# Run MySQL commands as root
sudo mysql -u root -p"${MYSQL_ROOT_PASSWORD}" <<EOF
-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;

-- Create the user if it doesn't exist
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';

-- Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';

-- Apply the changes immediately
FLUSH PRIVILEGES;
EOF

echo "Database '$DB_NAME' created and user '$DB_USER' granted access."

#Download Source code & Initialize Database
sudo yum install git
git clone -b main https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project
sudo mysql -u root -padmin123 accounts < src/main/resources/db_backup.sql
sudo mysql -u root -padmin123 accounts
#Restart mariadb-server
sudo systemctl restart mariadb.service