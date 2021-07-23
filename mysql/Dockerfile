FROM alpine:3.12
#мои
RUN apk update && apk upgrade
RUN apk add --no-cache vim mysql mysql-client openrc supervisor
VOLUME [ "/var/lib/mysql" ]
COPY src/start.sh ./
RUN chmod +x start.sh

COPY src/wordpress.sql /
RUN chmod -R 755 /wordpress.sql
COPY src/my.cnf /etc/mysql/
COPY src/supervisord.conf /etc/supervisord.conf
# COPY ./src/my_base ./my_base

EXPOSE 3306
RUN mkdir -p /run/mysqld
CMD sh start.sh
# CMD /usr/bin/supervisord -c /etc/supervisord.conf