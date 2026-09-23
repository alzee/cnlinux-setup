#!/bin/bash
#
# vim:ft=sh
# https://www.postgresql.org/ftp/source/

set -e

tar=$(echo postgresql-*.tar.*)

tar xf $tar

cd ${tar%.tar*}

# make distclean

echo configuring postgresql
./configure \
    --with-ssl=openssl \
    --with-systemd

make

sudo make install
