#!/bin/bash
#
# vim:ft=sh

# set -x
############### Variables ###############
pkg=dnf
pdir=$(realpath $(dirname $0))  # use absolute dir in case change/pushd dir

############### Functions ###############
log() {
    local level logfile
    level="$2"
    case $level in
        i_success)
            logfile=install.log
            ;;
        i_err)
            logfile=install.err.log
            ;;
        b_success)
            logfile=build.log
            ;;
        b_err)
            logfile=build.err.log
            ;;
        *)
            logfile=setup.log
            ;;
    esac

    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$pdir/log/$logfile"
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

for i in $pkgs
do
    echo Install... $i
    echo Try to get $i from repo...
    # TODO log
    sudo $pkg install -y $i

    if [ $? = 0 ]; then
            log "$i installed from repo" i_success
    else
        echo CAN NOT install $i from repo...
        if [ -f $i/build.sh ]; then
            echo Try to build from source...
            pushd $i 2> /dev/null || { echo $i dir not found ; continue; }
            echo Building $i...
            . build.sh
            [ $? = 0] && log "$i build success" b_success
            popd
        else
            log "$i install failed..." i_err
        fi
    fi

    # Post install setup
    if [ -f $i/setup.sh ]; then
        pushd $i 2> /dev/null || { echo $i dir not found ; continue; }
        echo Running post setup for $i...
        . setup.sh
        popd
    fi
done
