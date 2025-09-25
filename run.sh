#!/bin/bash
#
# vim:ft=sh

############### Variables ###############
pkg=dnf

############### Functions ###############
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$2"
}

############### Main Part ###############
which apt &> /dev/null
if [ $? = 0 ]; then
    echo Found apt
    pkg=apt
    sudo $pkg update
fi

mkdir -p log

echo Install packages...
pkgs=$(< pkgs)
sudo $pkg install -y $pkgs

for i in pkgs:
do
    echo Install... $i
    echo Try to get $i from repo...
    # TODO log
    sudo $pkg install -y $i

    if [ $? = 0]; then
            log "$i installed from repo" log/install.log
    else
        echo CAN NOT install $i from repo...
        if [ -f $i/build.sh ]; then
            echo Try to build from source...
            pushd $i 2> /dev/null || echo $i dir not found ; continue
            echo Building $i...
            . build.sh
            [ $? = 0] && log "$i build success" log/install.log
            popd
        else
            log "$i install failed..." log/install.err.log
        fi
    fi

    # Post install setup
    if [ -f $i/setup.sh ]; then
        pushd $i 2> /dev/null || echo $i dir not found ; continue
        echo Running post setup for $i...
        . setup.sh
        popd
    fi
done
