FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add openrc supervisor vim
RUN apk add nginx openssh openssl
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN echo -e "nginx-svc\nnginx-svc" | adduser nginx-svc
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/ST=Moscow/L=Moscow/O=Sheriotanda/CN=localhost' -keyout /etc/ssl/my.key -out /etc/ssl/my.crt

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./start_server.sh /tmp/start_server.sh

RUN mkdir -p /run/nginx
RUN mkdir -p /run/sshd

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/

RUN chmod +x /tmp/start_server.sh
EXPOSE 80 443 22
CMD [ "sh", "/tmp/start_server.sh" ]