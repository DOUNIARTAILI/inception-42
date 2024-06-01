FROM debian:bullseye

RUN apt update
RUN apt install mariadb-server -y
COPY /tools/script.sh /home/script.sh
RUN chmod +x /home/script.sh
EXPOSE 3306
CMD ["/home/script.sh"]