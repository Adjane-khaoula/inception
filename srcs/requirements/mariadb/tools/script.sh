
#!/bin/bash
service mariadb start
sleep 5

# echo "***********************************************************"
# Create a Database

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create a User and Grant Privileges
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%'\
         IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%'\
         IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -e "CREATE USER IF NOT EXISTS \`root\`@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Change the Root User Password
# mysql -e "ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql   -e "FLUSH PRIVILEGES;"

# echo "***********************************************************"

# Shutdown the MariaDB Server
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

# Start the MariaDB Server in Safe Mode (Optional)
exec  mysqld_safe --bind_address=0.0.0.0



# service mariadb start

# sleep 10

# mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_DATABASE}\`;"

# mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USERNAME}\`@'%'\
#          IDENTIFIED BY '${DB_PASSWORD}';"

# mariadb -e "GRANT ALL PRIVILEGES ON \`${DB_DATABASE}\`.* \
#         TO \`${DB_USERNAME}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

# mariadb -e "CREATE USER IF NOT EXISTS \`root\`@'%'\
#          IDENTIFIED BY '${DB_ROOT_PASSWORD}';"


# # mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"

# mariadb -e "FLUSH PRIVILEGES;"

# # service mariadb stop

# mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown



exec mysqld_safe --bind_address=0.0.0.0 












