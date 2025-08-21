#!/bin/bash
#
# vim:ft=sh

############### Variables ###############

############### Functions ###############

############### Main Part ###############

tar=$(echo screen-*.tar.*)

tar xf $tar

cd ${tar%.tar*}

echo configuring screen...
./configure

make

sudo make install
