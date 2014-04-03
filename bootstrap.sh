#!/usr/bin/env bash

# Update Ubuntu
apt-get update
apt-get dist-upgrade

# Install Lamp
apt-get install apache2 php5 libapache2-mod-php5 mysql-server php5-mysql
apt-get install curl libcurl3 libcurl3-dev php5-curl
service apache2 restart

# PHP 5.5 @todo check if there is a better way to install php5.5 now
# add-apt-repository ppa:ondrej/php5
# apt-get update
# apt-get upgrade
# apt-get dist-upgrade

a2enmod rewrite
a2enmod headers

# Fix Permissions
# HTTPDUSER=`ps aux | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
adduser ubuntu www-data
chown -R www-data:www-data /var/www
chmod -R g+rw /var/www
chown -R www-data:www-data /var/tmp
chmod -R g+rw /var/tmp

# ImageMagick
apt-get install imagemagick --fix-missing
apt-get install imagemagick
apt-get install curl

# Mcrypt
# apt-get install php5-mcrypt
# echo "extension=mcrypt.so" > /etc/php5/conf.d/mcrypt.ini

# APC
# sudo apt-get install php-pear php5-dev make libpcre3-dev
# sudo pecl install apc
# echo "extension=apc.so" > /etc/php5/conf.d/apc.ini

# Restart Apache
service apache2 restart