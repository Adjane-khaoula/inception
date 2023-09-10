FROM debian:bullseye

RUN apt-get update
RUN apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3\
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
COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/
# COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/script.sh /script.sh
RUN chmod +x script.sh
RUN mkdir /run/php/
ENTRYPOINT ["sh", "script.sh"]
CMD ["php-fpm7.3", "-R", "-F"]

# # Modify the configuration file within the container
# RUN sed -i 's/^;clear_env = no/clear_env = no/' /etc/php/7.4/fpm/pool.d/www.conf
# RUN sed -i 's/^listen = .*/listen = wordpress:9000/' /etc/php/7.4/fpm/pool.d/www.conf