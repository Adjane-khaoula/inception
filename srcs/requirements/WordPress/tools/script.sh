#!/bin/bash
sleep 10

cd /var/www/html/wordpress
rm -rf *

wp core download --allow-root

mv wp-config-sample.php  wp-config.php
sed -i "s/database_name_here/$SQL_DATABASE/1" wp-config.php
sed -i "s/username_here/$SQL_USER/1" wp-config.php
sed -i "s/password_here/$SQL_PASSWORD/g" wp-config.php
sed -i "s/localhost/$SQL_HOST/g" wp-config.php

wp core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${Word_USER} --admin_password=${Word_PW} --admin_email=${Word_EMAIL} --allow-root
php-fpm7.4 -R -F

# Check if the 'kadjane' user exists.
if wp user list --field=user_login --allow-root | grep -q $user_name; then
  echo "The $user_name user already exists."
else
  # If the 'kadjane' user doesn't exist, create it.
  wp user create $user_name $user_EMAIL --role=author --user_pass=$user_pw --allow-root
  echo "The 'kadjane' user has been created."
fi