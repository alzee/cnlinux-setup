#!/bin/bash
#
# vim:ft=sh

############### Variables ###############

############### Functions ###############

############### Main Part ###############

tar=$(echo php-*.tar.*)

tar xf $tar

cd ${tar%.tar*}

# make clean

echo configuring php...

./configure --enable-fpm \
    --with-fpm-systemd \
    --with-mysqli=mysqlnd \
    --with-pdo-mysql=mysqlnd \
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
    --with-jpeg \
    --with-xpm \
    --with-webp \
    --with-freetype \
    --enable-bcmath \
    --enable-intl
    # --with-avif \
    # --with-pgsql=/usr/local/pgsql \
    # --enable-opcache \

make -j4

sudo make install
