#!/bin/bash

# Setting up bind-address
printf "\n[server]\nbind-address=0.0.0.0\nport=3306\n" >> /etc/mysql/my.cnf

# Starting MYSQL service
service mysql start

# Creating WordPress user and database
echo "Creating WP user and database"
mysql --user=root --password="" <<_EOF_
CREATE DATABASE ${WP_DB_NAME};
GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DATABASE_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
_EOF_