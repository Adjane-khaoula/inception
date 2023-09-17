#!/bin/bash

# # cd /var/www/html
# # mkdir /var/www/
# # mkdir /var/www/html
sleep 10

cd /var/www/html/wordpress
rm -rf *

wp core download --allow-root
# wp core create	--allow-root \
# 	--dbname=$SQL_DATABASE \
# 	--dbuser=$SQL_USER \
# 	--dbpass=$SQL_PASSWORD \
# 	--dbhost=mariadb:3306 --path='/var/www/html/wordpress'
mv wp-config-sample.php  wp-config.php
sed -i "s/database_name_here/$SQL_DATABASE/1" wp-config.php
sed -i "s/username_here/$SQL_USER/1" wp-config.php
sed -i "s/password_here/$SQL_PASSWORD/g" wp-config.php
sed -i "s/localhost/$SQL_HOST/g" wp-config.php

# Creating the wp-config.php file using this command.
# wp core config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root
# Installing wordpress using the given environment variables to avoid showing the wordpress installation page everytime we run the containe
wp core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${Word_USER} --admin_password=${Word_PW} --admin_email=${Word_EMAIL} --allow-root
php-fpm7.4 -R -F
# exec $@

