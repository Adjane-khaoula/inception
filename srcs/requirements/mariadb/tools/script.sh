#!/bin/bash
service mariadb start
sleep 10
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%'\
         IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%'\
         IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "CREATE USER IF NOT EXISTS \`root\`@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql   -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
exec  mysqld_safe --bind_address=0.0.0.0










