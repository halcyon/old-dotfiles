#!/bin/bash
git clone $1 /var/lib/lxc/$2
cd /var/lib/lxc/$2
./bootstrap.sh $2 1>/dev/null
cd -
lxc-start -n $2 -d
