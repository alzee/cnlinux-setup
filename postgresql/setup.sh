#!/bin/bash
#
# vim:ft=sh

############### Variables ###############

############### Functions ###############

############### Main Part ###############
sudo adduser -M postgres
sudo mkdir -p /usr/local/pgsql/data
sudo chown postgres /usr/local/pgsql/data
# sudo su - postgres
sudo -u postgres /usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data
# /usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data -l logfile start
# /usr/local/pgsql/bin/createdb test
# /usr/local/pgsql/bin/psql test

sudo cp postgresql.service /usr/lib/systemd/system/

sudo systemctl enable --now postgresql
