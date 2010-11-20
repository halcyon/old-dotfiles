#!/bin/bash
git clone $1 $2
cd $2
./bootstrap.sh $2 1>/dev/null
cd ..
lxc-start -n $2 -d
