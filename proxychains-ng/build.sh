#!/bin/bash
#
# vim:ft=sh

set -e

dir=proxychains-ng.git

git clone https://github.com/rofl0r/proxychains-ng.git $dir
cd $dir

./configure --prefix=/usr --sysconfdir=/etc

make

sudo make install
sudo make install-config # installs proxychains.conf
