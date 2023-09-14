FROM debian:bullseye

RUN apt-get update
RUN apt upgrade -y
RUN apt-get install -y mariadb-server

COPY ./tools/script ./script
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
# RUN service mariadb start
RUN chmod +x script

# ENV MYSQL_DATABASE = "wordpress"
# ENV MYSQL_USER = "kadjane"
# ENV MYSQL_PASSWORD = "123"
# # ENV MYSQL_HOST = "localhost"
# ENV MYSQL_ROOT_PASSWORD = "12345"
# RUN ./script
# ARG MYSQL_ROOT_PASSWORD
# CMD ["mysqld"]
CMD ["bash","script"]
# CMD ["./script"]

# socket  = /run/mysqld/mysqld.sock 