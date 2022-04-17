#!/bin/sh

rc default
/etc/init.d/mariadb setup
rc-service mariadb start
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';"  | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
mysql wordpress -u root --password= < /tmp/wordpress.sql

rc-service mariadb stop

telegraf & usr/bin/mysqld -u root