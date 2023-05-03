FROM debian:buster

ARG DOMAIN_NAME

RUN apt update && apt upgrade -y

RUN	apt install -y nginx openssl

RUN openssl req -x509 -nodes -newkey rsa:2048 \
    -subj "/C=FR/O=42/CN=$DOMAIN_NAME" \
	-keyout /etc/ssl/certs/nginx-dpiza.key \
    -out /etc/ssl/certs/nginx-dpiza.crt

COPY conf/dpiza.conf /etc/nginx/sites-available/dpiza

RUN ln -s /etc/nginx/sites-available/dpiza /etc/nginx/sites-enabled

CMD ["nginx", "-g", "daemon off;"]