FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add openrc vim
RUN apk add vsftpd openssh openssl
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/ST=Moscow/L=Moscow/O=Sheriotanda/CN=localhost' -keyout /etc/ssl/my.key -out /etc/ssl/my.crt

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./start_server.sh /tmp/start_server.sh

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/

EXPOSE 21 30000

CMD [ "sh", "/tmp/start_server.sh" ]