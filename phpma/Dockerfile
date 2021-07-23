FROM alpine:3.12
# #мои
RUN apk update && apk upgrade
RUN apk add --no-cache vim wget nginx supervisor php7 php7-fpm php7-mysqli php7-mbstring
RUN apk add --no-cache php7-opcache php7-gd php7-json php7-session php7-ctype php7-iconv php7-xml

# VOLUME [ "/sys/fs/cgroup" ]

COPY src/start.sh ./
RUN chmod +x start.sh
COPY src/nginx-config.conf /etc/nginx/conf.d/default.conf
COPY src/supervisord.conf /etc/supervisord.conf

#install_and_conf_phpmyadmin

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz && \
    rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz && mv phpMyAdmin-5.0.4-all-languages /etc/phpmyadmin
COPY src/config.inc.php /etc/phpmyadmin

#install_and_conf_telegraf
# RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz && \
# tar -xvzf telegraf-1.16.2_linux_amd64.tar.gz && rm telegraf-1.16.2_linux_amd64.tar.gz
# RUN mv telegraf-1.16.2 /etc/telegraf
# COPY src/telegraf.conf /etc/telegraf.conf

RUN mkdir -p /etc/phpMyAdmin/tmp && chmod 777 /etc/phpMyAdmin/tmp
RUN mkdir -p /var/run/php
RUN mkdir -p var/run/nginx
EXPOSE 5000
CMD sh start.sh