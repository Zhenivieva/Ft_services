FROM alpine:3.12

RUN apk update && apk upgrade  
RUN apk add vim vsftpd openssl supervisor
# RUN apk add vim vsftpd openssl supervisor openrc
#попробовать отключить:
VOLUME [ "/home/ftps" ]

# COPY src/start.sh ./
# RUN chmod +x start.sh
COPY src/vsftpd.conf /etc/vsftpd/vsftpd.conf
#попробовать отключить:
RUN chmod -R 777 /etc/vsftpd/vsftpd.conf
COPY src/supervisord.conf /etc/supervisord.conf
#create_ssl
RUN openssl req -x509 -days 365 -newkey rsa:2048 -nodes \
   -out /etc/ssl/certs/ftps-cert.crt -subj '/C=RU/ST=Tatarstan/L=Kazan/O=21_school/CN=mmaryjan'\
   -keyout /etc/ssl/private/ftps-cert.key

RUN mkdir -p /var/log/ftp && touch /var/log/ftp/xferlog
RUN echo "root:0000" | chpasswd

# RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz && \
# tar -xvzf telegraf-1.16.2_linux_amd64.tar.gz && rm telegraf-1.16.2_linux_amd64.tar.gz
# RUN mv telegraf-1.16.2 /etc/telegraf
# COPY src/telegraf.conf /etc/telegraf.conf

#или:
# RUN mkdir -p home/ftps/admin && chmod 777 home/ftps/admin
# RUN adduser --home "home/ftps/admin" -D admin && echo "admin:admin" | chpasswd
WORKDIR /
EXPOSE 21 21048
# CMD vsftpd /etc/vsftpd/vsftpd.conf
CMD /usr/bin/supervisord -c /etc/supervisord.conf