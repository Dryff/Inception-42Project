FROM debian:11

RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y
RUN apt install vim -y
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/init-db.sql /docker-entrypoint-initdb.d/
CMD ["mysqld", "--bind-address=0.0.0.0"]