#!/bin/bash
#
# vim:ft=sh

sudo cp www.conf /usr/local/etc/php-fpm.d/
sudo cp php-fpm.service /usr/lib/systemd/system/
sudo cp php-fpm.conf /usr/local/etc/
sudo chmod 644 /usr/local/etc/php-fpm.conf
sudo mkdir /var/log/php-fpm/

sudo systemctl enable --now php-fpm
#sudo setfacl -m u:apache:rw /run/php-fpm/www.sock
