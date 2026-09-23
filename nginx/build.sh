#!/bin/bash
#
# vim:ft=sh

set -e

dir=nginx.git

git clone https://github.com/nginx/nginx $dir
cd $dir
