FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY ./tools/script.sh /script.sh
# COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
# RUN service mariadb start
RUN chmod 777 script.sh

CMD ["bash", "script.sh"]