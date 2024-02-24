#!/bin/bash
set -e
sed -i 's/^bind-address/#bind-address/' /etc/mysql/mariadb.conf.d/50-server.cnf
service mariadb start
mysql -u root -ppassword -e "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;"
mysql -u root -ppassword -e "CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';"
mysql -u root -ppassword -e "GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%';"
mysql -u root -ppassword -e "FLUSH PRIVILEGES;"
service mariadb stop
exec "$@"

