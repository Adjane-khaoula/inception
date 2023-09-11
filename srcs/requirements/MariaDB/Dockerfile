FROM debian:bullseye

RUN apt-get update
RUN apt upgrade -y
RUN apt-get install -y mariadb-server

COPY ./tools/script ./script
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
# RUN service mariadb start
RUN chmod +x script
# RUN ./script
# ARG MYSQL_ROOT_PASSWORD
# CMD ["mysqld"]
CMD ["service", "mariadb", "start", "&&", "sleep", "5", "&&", "./script"]

# socket  = /run/mysqld/mysqld.sock