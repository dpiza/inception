FROM debian:buster

RUN apt update && apt upgrade -y

RUN apt install -y php php7.3-fpm php-mysql wget mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php

RUN sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" /etc/php/7.3/fpm/pool.d/www.conf

RUN touch /var/log/php7.3-fpm.log

COPY tools/setup.sh /var/www/wordpress/setup.sh

RUN wp core download --path=/var/www/wordpress --allow-root

RUN chown -R www-data:www-data /run/php /var/log/php7.3-fpm.log /var/www/wordpress

USER www-data

WORKDIR /var/www/wordpress/

ENTRYPOINT ["/bin/sh", "setup.sh"]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]