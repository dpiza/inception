#!/bin/bash

# Setting up bind-address
printf "\n[server]\nbind-address=0.0.0.0\nport=3306\n" >> /etc/mysql/my.cnf

# Starting MYSQL service
service mysql start

# Creating WordPress user and database
echo "Creating WP user and database"
mysql --user=root --password="" <<_EOF_
CREATE DATABASE ${MARIADB_DATABASE};
GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
_EOF_

# exec "$@"
