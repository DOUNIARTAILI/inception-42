FROM debian:bullseye

RUN apt update
RUN apt install nginx -y
RUN apt install openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/ssl-key.crt -keyout /etc/nginx/ssl/ssl-key.key -subj "/C=MA/ST=NN/L=Khouribga/O=42/OU=42/CN=drtaili.42.fr/UID=drtaili"

COPY /conf/nginx.conf /etc/nginx/nginx.conf

RUN chown -R www-data:www-data /var/www/html


CMD ["nginx", "-g", "daemon off;"]










