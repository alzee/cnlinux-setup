#!/bin/bash
#
# vim:ft=sh

############### Variables ###############

############### Functions ###############

############### Main Part ###############
tar=screen-4.9.1.tar.gz

tar xf $tar

cd ${tar%.tar*}

echo configuring screen...
./configure

make

sudo make install
