#!/bin/sh

cd /var/www/html
wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root
wp core install --url=$DOMAIN_NAME --title="My-page" --admin_user=$ADMIN_USER --admin_email=$ADMIN_EMAIL --admin_password=$ADMIN_PASS --path=$DB_PATH --allow-root
wp user create $NEW_USER $NEW_EMAIL --allow-root --role=$ROLE

exec "$@"