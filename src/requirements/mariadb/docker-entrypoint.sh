#!/bin/bash
set -e
service mariadb start
mysql < /docker-entrypoint-initdb.d/init.sql
service mariadb stop && sed -i 's/^bind-address/#bind-address/' /etc/mysql/mariadb.conf.d/50-server.cnf && exec "$@"

