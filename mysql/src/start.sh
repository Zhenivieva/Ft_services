#!/bin/sh

# db_name='wordpress'
# username='root'

rc default
/etc/init.d/mariadb setup
rc-service mariadb start
# mysql -u root mysql < my_base
mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER 'root'@'%' IDENTIFIED BY 'root'"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"

# запись б.д. с юзерами в только что созданную бд
mysql -uroot wordpress < wordpress.sql
rc-service mariadb stop
supervisord -c /etc/supervisord.conf


# rc default
# /etc/init.d/mariadb setup
# rc-service mariadb start
# echo "CREATE DATABASE wordpress" | mysql && \
# echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION" | mysql && \
# echo "FLUSH PRIVILEGES;" | mysql
# mysql -uroot wordpress < wordpress.sql
# rc-service mariadb stop
# supervisord -c /etc/supervisord.conf
