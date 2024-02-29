#!/bin/bash
set -e
service mariadb start
mysql -u root -p$WORDPRESS_DB_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;"
mysql -u root -p$WORDPRESS_DB_PASSWORD -e "CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_$WORDPRESS_DB_PASSWORD';"
mysql -u root -p$WORDPRESS_DB_PASSWORD -e "GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%';"
mysql -u root -p$WORDPRESS_DB_PASSWORD -e "FLUSH PRIVILEGES;"
service mariadb stop
sed -i 's/^bind-address/#bind-address/' /etc/mysql/mariadb.conf.d/50-server.cnf
exec "$@"

