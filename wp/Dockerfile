FROM alpine:3.12
#мои
RUN apk update && apk upgrade
RUN apk add vim wget nginx supervisor openrc php7 php7-fpm php7-mysqli php7-mbstring
RUN apk add --no-cache php7-opcache php7-gd php7-json php7-session php7-ctype php7-iconv php7-xml

COPY src/nginx-config.conf /etc/nginx/conf.d/default.conf
COPY src/supervisord.conf /etc/supervisord.conf

RUN wget https://wordpress.org/latest.tar.gz
RUN tar xfz latest.tar.gz && rm latest.tar.gz
RUN mv wordpress /var/www/
COPY src/wp-config.php /var/www/wordpress/wp-config.php

# RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz && \
# tar -xvzf telegraf-1.16.2_linux_amd64.tar.gz && rm telegraf-1.16.2_linux_amd64.tar.gz
# RUN mv telegraf-1.16.2 /etc/telegraf
# COPY src/telegraf.conf /etc/telegraf.conf

RUN mkdir -p /var/run/php
RUN mkdir -p /run/nginx
RUN mkdir -p /var/log/supervisor
EXPOSE 5050
# CMD sh start.sh
CMD supervisord -c /etc/supervisord.conf