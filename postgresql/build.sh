#!/bin/bash
#
# vim:ft=sh

set -e

tar=$(echo postgresql-*.tar.*)

tar xf $tar

cd ${tar%.tar*}

make distclean

echo configuring postgresql
./configure \
    --with-ssl=openssl \
    --with-systemd

make

sudo make install
