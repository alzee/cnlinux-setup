#!/bin/bash
#
# vim:ft=sh

set -e

tar=$(echo PACKAGENAME-*.tar.*)

# if tarbar not there
if [ ! -f $tar ]; then
    # download
    # url=https://
    # tar=xxx
    # curl -L -o $tar $url
    #
    # checksum
    #
fi

tar xf $tar

cd ${tar%.tar*}

echo configuring PACKAGENAME...

# TODO log
./configure

make -j4

sudo make install
