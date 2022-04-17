FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add vim openrc wget

RUN apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY ./start_server.sh ./tmp
RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/
COPY ./grafana.db /usr/share/grafana/data/

RUN chmod +x ./tmp/start_server.sh
EXPOSE 3000
CMD  [ "sh", "./tmp/start_server.sh" ]