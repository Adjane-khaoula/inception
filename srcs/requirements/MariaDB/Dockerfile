FROM debian:bullseye

RUN apt-get update\ 
    apt upgrade -y\
    apt-get install -y mariadb-server

COPY ./tools/script ./script
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x script
RUN ./script
CMD ["mysqld"]