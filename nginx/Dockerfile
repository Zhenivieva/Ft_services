FROM alpine:3.12
#мои
RUN apk update && apk upgrade
RUN apk add --no-cache vim nginx openssl supervisor openrc

# VOLUME [ "/sys/fs/cgroup" ]

COPY src/start.sh ./
RUN chmod +x start.sh
COPY src/nginx-mconfig.conf /etc/nginx/conf.d/default.conf
COPY src/supervisord.conf /etc/supervisord.conf
#create_ssl
RUN openssl req -x509 -days 365 -newkey rsa:2048 -nodes \
   -out /etc/ssl/certs/nginx-cert.crt -subj '/C=RU/ST=Tatarstan/L=Kazan/O=21_school/CN=mmaryjan'\
   -keyout /etc/ssl/private/nginx-cert.key

# folder for PID file
RUN mkdir -p /run/nginx
EXPOSE 80 443
CMD sh start.sh