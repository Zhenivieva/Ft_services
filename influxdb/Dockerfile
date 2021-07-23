FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add supervisor influxdb  libc6-compat mysql mysql-client
# RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz && \
tar -xvzf telegraf-1.16.2_linux_amd64.tar.gz && rm telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 /etc/telegraf
# COPY src/telegraf.conf /etc/telegraf/telegraf.conf
RUN etc/telegraf/usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > etc/telegraf/telegraf.conf

COPY src/supervisord.conf /etc/supervisord.conf

EXPOSE 8086

CMD supervisord -c /etc/supervisord.conf