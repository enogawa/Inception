-- init.sql

CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
CREATE DATABASE IF NOT EXISTS wordpress_db;
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'user'@'%';
FLUSH PRIVILEGES;
