FROM debian:bullseye

RUN apt-get update
RUN apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.4\
    php-fpm\
    php-mysql\
    mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy the modified www.conf from your host to the container
# RUN rm -rf /var/www/wordpress
# RUN mkdir /var/www/wordpress
# COPY ./tools/wp-config.php /var/www/wordpress

COPY ./tools/www.conf /etc/php/7.4/fpm/
COPY ./tools/script.sh ./script.sh
RUN chmod +x script.sh
RUN mkdir /run/php/
ENTRYPOINT ["sh", "script.sh"]
CMD ["php-fpm7.4", "-R", "-F"]


# # Use a Debian base image
# FROM debian:bullseye

# # Update and upgrade packages, then install required tools
# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get install -y wget

# # Install PHP and MariaDB client
# RUN apt-get install -y php7.4 php-fpm php-mysql mariadb-client

# # Install WP-CLI globally
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar && \
#     mv wp-cli.phar /usr/local/bin/wp

# # Copy the script and www.conf files
# COPY ./tools/www.conf /etc/php/7.4/fpm/
# # COPY /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
# COPY ./tools/script.sh /script.sh
# RUN chmod +x /script.sh

# # Create necessary directory
# RUN mkdir /run/php/

# # Define entry point
# ENTRYPOINT ["sh", "/script.sh"]









# RUN mkdir /var/www/
# RUN mkdir /var/www/html
# RUN mkdir /var/www/html/wordpress
# RUN cd /var/www/html/wordpress
# RUN rm -rf *
# COPY ./tools/wp-config.php /var/www/wordpress
# COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/
# COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

# # Modify the configuration file within the container
# RUN sed -i 's/^;clear_env = no/clear_env = no/' /etc/php/7.4/fpm/pool.d/www.conf
# RUN sed -i 's/^listen = .*/listen = wordpress:9000/' /etc/php/7.4/fpm/pool.d/www.conf