#!/bin/bash
#
# vim:ft=bash

# AllowTcpForwarding yes
sed -i /^AllowTcpForwarding/s/no/yes/ /etc/ssh/sshd_conf
# PermitRootLogin yes
#sed -i /^PermitRootLogin/s/yes/no/ /etc/ssh/sshd_conf
# PasswordAuthentication yes
#sed -i /^PasswordAuthentication/s/yes/no/ /etc/ssh/sshd_conf
sudo systemctl restart sshd

# docker proxy
# dnf proxy
