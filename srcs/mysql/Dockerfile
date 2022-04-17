FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add vim openrc
RUN apk add mariadb mariadb-common mariadb-client
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY ./my.cnf /etc/mysql/

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/

COPY ./wordpress.sql ./tmp
COPY ./start_server.sh ./tmp

RUN chmod +x ./tmp/start_server.sh
VOLUME [ "var/lib/mysql" ]
VOLUME [ "/sys/fs/cgroup" ]
EXPOSE 3306
CMD  [ "sh", "./tmp/start_server.sh" ]