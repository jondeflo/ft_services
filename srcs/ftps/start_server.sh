#!/bin/sh
mkdir -p /var/ftp
adduser -D -h /var/ftp user
echo 'user:user' | chpasswd
rc default
telegraf & vsftpd /etc/vsftpd/vsftpd.conf