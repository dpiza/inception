FROM debian:buster

ARG MARIADB_DATABASE
ARG MARIADB_ROOT_PASSWORD
ARG MARIADB_USER
ARG MARIADB_PASSWORD

RUN apt update && apt upgrade -y

RUN	apt install -y mariadb-server

RUN chown -R mysql:mysql /var/lib/mysql

COPY tools/setup.sh /tmp

RUN chmod +x /tmp/setup.sh && \
    /tmp/setup.sh

# ENTRYPOINT ["/tmp/setup.sh"]

CMD ["mysqld_safe"]
