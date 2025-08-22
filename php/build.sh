#!/bin/bash
#
# vim:ft=sh

############### Variables ###############

############### Functions ###############

############### Main Part ###############

tar=$(echo php-*.tar.*)

tar xf $tar

cd ${tar%.tar*}

echo configuring php...

./configure --enable-fpm \
    --with-fpm-systemd \
    --with-mysqli=mysqlnd \
    --enable-mbstring \
    --disable-mbregex \
    --with-readline \
    --with-pdo-pgsql \
    --with-pgsql \
    --enable-intl

make -j4

sudo make install

sudo cp www.conf /usr/local/etc/php-fpm.d/
sudo cp php-fpm.service /usr/lib/systemd/system/
sudo cp php-fpm.conf /usr/local/etc/
sudo chmod 644 /usr/local/etc/php-fpm.conf
sudo mkdir /var/log/php-fpm/

sudo systemctl enable --now php-fpm
