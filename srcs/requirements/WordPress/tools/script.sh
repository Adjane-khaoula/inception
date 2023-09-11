# mkdir /var/www/
# mkdir /var/www/html
# mkdir /var/www/html/wordpress

# cd /var/www/html

# rm -rf *
cd /var/www/html/wordpress
#Downloading and extracting Wordpress core files to the current directory
wp core download --allow-root
# Creating the wp-config.php file using this command.
wp core config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root
# Installing wordpress using the given environment variables to avoid showing the wordpress installation page everytime we run the containe
wp core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${WP_USER} --admin_password=${WP_PW} --admin_email=${WP_EMAIL} --allow-root
exec $@















# sleep 10
# wp config create	--allow-root \
# 					--dbname=$SQL_DATABASE \
# 					--dbuser=$SQL_USER \
# 					--dbpass=$SQL_PASSWORD \
# 					--dbhost=mariadb:3306 --path='/var/www/wordpress'



# #!/bin/bash

# # create directory to use in nginx container later and also to setup the wordpress conf

# # curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

# # chmod +x wp-cli.phar 

# # mv wp-cli.phar /usr/local/bin/wp


# wp core download --allow-root

# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# mv /wp-config.php /var/www/html/wp-config.php


# sed -i -r "s/db1/$db_name/1"   wp-config.php
# sed -i -r "s/user/$db_user/1"  wp-config.php
# sed -i -r "s/pwd/$db_pwd/1"    wp-config.php

# wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root




# wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root


# wp theme install astra --activate --allow-root


# wp plugin install redis-cache --activate --allow-root

# wp plugin update --all --allow-root


 
# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# mkdir /run/php



# wp redis enable --allow-root

# /usr/sbin/php-fpm7.3 -F
