FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add vim openrc
RUN apk add supervisor influxdb
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/

COPY ./start_server.sh ./tmp

RUN chmod +x ./tmp/start_server.sh
VOLUME [ "/root/.influxdb" ]
VOLUME [ "/sys/fs/cgroup" ]
EXPOSE 8086
CMD  [ "sh", "./tmp/start_server.sh" ]