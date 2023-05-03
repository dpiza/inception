FROM debian:buster

ARG WP_DB_NAME
ARG DATABASE_ROOT_PASSWORD
ARG WP_DB_USER
ARG WP_DB_PASSWORD

RUN apt update && apt upgrade -y

RUN	apt install -y mariadb-server

RUN chown -R mysql:mysql /var/lib/mysql

COPY tools/setup.sh /tmp

RUN chmod +x /tmp/setup.sh && \
    /tmp/setup.sh

CMD ["mysqld_safe"]