#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ];
then
    wp core download --allow-root
    wp core config --dbhost=my-db --dbname=$MY_DATABASE --dbuser=$MYDB_USER --dbpass=$MYDB_USER_PASSWORD --allow-root
    wp core install --url=$WP_URL --title="Drtaili Blog" --admin_name=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
    wp user create ${MYDB_USER} ${MYDB_USER_EMAIL} --user_pass=$MYDB_USER_PASSWORD --role=$USER_ROLE --allow-root
fi
exec php-fpm7.4 -F

