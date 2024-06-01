FROM debian:bullseye

RUN apt update
RUN apt install php php-mysql mariadb-client -y
RUN apt install php7.4-fpm -y
RUN service php7.4-fpm start
COPY /tools/script.sh /home/
RUN chmod +x /home/script.sh
WORKDIR /var/www/html/
RUN rm -rf *
RUN apt install wget

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && chmod +x /usr/local/bin/wp
RUN sed -i 's@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
EXPOSE 9000
CMD ["/home/script.sh"]
