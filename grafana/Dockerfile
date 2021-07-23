FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget supervisor libc6-compat
# RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community

# RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
# RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz && \
tar -xvzf grafana-7.3.6.linux-amd64.tar.gz && rm grafana-7.3.6.linux-amd64.tar.gz
# RUN apk add glibc-2.32-r0.apk

COPY src/grafana.db /grafana-7.3.6/data/
COPY src/supervisord.conf /etc/supervisord.conf

# RUN mkdir -p /etc/telegraf
# COPY telegraf.conf /etc/telegraf.conf

EXPOSE 3000

CMD supervisord -c /etc/supervisord.conf