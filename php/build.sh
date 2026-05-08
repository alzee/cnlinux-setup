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
    --with-openssl \
    --with-zlib \
    --with-curl \
    --with-zip \
    --enable-gd \
    --enable-bcmath \
    --enable-intl
	# --with-pgsql=/usr/local/pgsql \
    # --enable-opcache \

make -j4

sudo make install
