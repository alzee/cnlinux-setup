#!/bin/bash
#
# vim:ft=sh

############### Variables ###############

############### Functions ###############

############### Main Part ###############

echo Load ash...
unzip ash.zip
mv ash-master ~/.ash
~/.ash/a.sh -L
rm ash.zip

echo Install tools...
sudo dnf install flex bison httpd readline-devel

echo Building screen...
pushd screen/
. build_screen.sh
popd

###
echo Building php...
pushd php/
. build_php.sh
popd

###
echo Building postgresql...
pushd postgresql/
. build_postgresql.sh
popd

sudo systemctl enable --now httpd
