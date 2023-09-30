FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY ./tools/script.sh /script.sh
RUN chmod 777 script.sh

CMD ["bash", "script.sh"]