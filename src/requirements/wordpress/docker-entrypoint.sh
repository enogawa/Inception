#!/bin/sh

cd /var/www/html
wp config create --dbname="wordpress_db" --dbuser="user" --dbpass="password" --dbhost="mariadb" --path=/var/www/html --allow-root
wp core install --url=enogawa.42.fr --title="My-page" --admin_user=user --admin_email="info@wp-cli.org" --admin_password="password" --path=/var/www/html --allow-root
wp user create enogawa test@gmail.com --allow-root --role=author

exec "$@"