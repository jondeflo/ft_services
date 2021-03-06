FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add vim wget nginx supervisor openrc openssl
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-english.tar.xz
RUN	mkdir -p /var/www/phpmyadmin
RUN tar -xf phpMyAdmin-4.9.2-english.tar.xz --strip-components 1 -C /var/www/phpmyadmin

RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/ST=Moscow/L=Moscow/O=Sheriotanda/CN=localhost' -keyout /etc/ssl/my.key -out /etc/ssl/my.crt

RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php

COPY ./config.inc.php /var/www/phpmyadmin
COPY ./nginx.conf /etc/nginx/conf.d/nginx.conf
COPY ./supervisord.conf /etc/supervisord.conf

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/

COPY ./start_server.sh ./tmp
RUN chmod +x ./tmp/start_server.sh

EXPOSE 5000

CMD [ "sh", "/tmp/start_server.sh" ]