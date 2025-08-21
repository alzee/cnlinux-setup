#!/bin/bash
#
# vim:ft=sh

############### Variables ###############

############### Functions ###############

############### Main Part ###############

pmgr=dnf
which apt &> /dev/null
if [ $? = 0 ]; then
    echo Found apt
    pmgr=apt
    sudo $pmgr update
fi


echo Install packages...
pkgs=$(< pkgs)
sudo $pmgr install -y $pkgs

for i in pkgs:
do
    echo Install... $i
    echo Try to get $i from repo...
    sudo $pmgr install -y $i

    # If install from repo failed
    if [ $? != 0]; then
        echo CAN NOT install $i from repo...
        echo Try to build from source...
        pushd $i 2> /dev/null || echo $i dir not found ; continue
        echo Building $i...
        . build_$i.sh
        popd
    fi

    # Post install setup
    if [ -f $i/setup_$i.sh ]; then
        pushd $i 2> /dev/null || echo $i dir not found ; continue
        echo Running post setup for $i...
        . setup_$i.sh
        popd
    fi
done
