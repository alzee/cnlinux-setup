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
