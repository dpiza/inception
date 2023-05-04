#!/bin/bash

if ! wp core is-installed --path=/var/www/wordpress; then

    wp core config \
        --dbname=${WP_DB_NAME} \
        --dbuser=${WP_DB_USER} \
        --dbpass=${WP_DB_PASSWORD} \
        --dbhost=${DATABASE_HOST} \
        --dbprefix='wp_' \
        --dbcharset="utf8"

    wp core install \
        --url=${DOMAIN_NAME} \
        --title=${WP_TITLE} \
        --admin_user=${WP_ADMIN_USR} \
        --admin_password=${WP_ADMIN_PWD} \
        --admin_email=${WP_ADMIN_EMAIL} \
        --skip-email
    
	wp option update --path=/var/www/wordpress blogdescription "${WP_SUB_TITLE}"

    wp user create ${WP_USR} ${WP_EMAIL} --user_pass=${WP_PWD} --role=subscriber

    wp theme activate twentytwentytwo

fi

exec "$@"