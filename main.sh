#!/bin/bash

cp -f /var/www/html/php.ini /etc/php/$(ls /etc/php/)/apache2/php.ini
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

echo '[+] Starting mysql...'
service mysql start
mysql -uroot -pvulnerables -e "CREATE USER dvwa@localhost IDENTIFIED BY 'p@ssw0rd'; GRANT ALL privileges ON dvwa.* TO 'dvwa'@localhost;flush privileges;"
echo '[+] Starting apache'
service apache2 start

while true
do
    tail -f /var/log/apache2/*.log
    exit 0
done
