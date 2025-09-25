#!/bin/bash
#
# vim:ft=sh

############### Variables ###############

############### Functions ###############

############### Main Part ###############

tar=$(echo postgresql-*.tar.*)

tar xf $tar

cd ${tar%.tar*}

echo configuring postgresql
./configure --with-systemd

make

sudo make install
