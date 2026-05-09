#!/bin/bash
#
# vim:ft=sh

set -e

tar=$(echo postgresql-*.tar.*)

tar xf $tar

cd ${tar%.tar*}

echo configuring postgresql
./configure --with-systemd

make

sudo make install
