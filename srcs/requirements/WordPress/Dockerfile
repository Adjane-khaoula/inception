FROM debian:bullseye


RUN apt-get update
RUN apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.4\
    php-fpm\
    php-mysql\
    mariadb-client\
    sendmail\
    php7.4-fpm


RUN mkdir -p /var/www/html/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# RUN	chown -R root:root /var/www/html/wordpress

COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d
COPY ./tools/script.sh /script.sh
RUN chmod 777 script.sh
RUN mkdir /run/php/
# ENTRYPOINT ["sh", "script.sh"]
CMD ["./script.sh"]


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


# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
# RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
