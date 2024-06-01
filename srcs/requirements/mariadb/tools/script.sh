#!/bin/bash


service mariadb start
sleep 2
chmod 777 /run/mysqld/mysqld.sock
sed -i 's@= 127.0.0.1@= 0.0.0.0@' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/socket = /run/mysqld/mysqld.sock/socket = /var/run/mysqld/mysqld.sock/g' /etc/mysql/my.cnf
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MY_DATABASE;"
mysql -u root -e "CREATE USER IF NOT EXISTS '$MYDB_USER'@'%' IDENTIFIED BY '$MYDB_USER_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MY_DATABASE.* TO '$MYDB_USER'@'%';"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYDB_USER_PASSWORD';"
mysql -u root -e "FLUSH PRIVILEGES;"
kill $(cat /var/run/mysqld/mysqld.pid)

exec mysqld

