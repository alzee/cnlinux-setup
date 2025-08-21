#!/bin/bash
#
# vim:ft=sh

############### Variables ###############

############### Functions ###############

############### Main Part ###############

echo Install packages...
pkgs=$(< pkgs)
sudo dnf install -y $pkgs

for i in pkgs:
do
    echo Install... $i
    echo Try to get $i from repo...
    sudo dnf install -y $i

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
