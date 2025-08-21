#!/bin/bash
#
# vim:ft=sh

############### Variables ###############

############### Functions ###############

############### Main Part ###############

sudo dnf install flex bison httpd readline-devel

###
###


sudo systemctl enable --now httpd
