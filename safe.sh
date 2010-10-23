#!/bin/bash
if [ ! -f `dirname $0`/safe.lock ]
then
  touch `dirname $0`/safe.lock
  iproxy 2222 22 &
  ssh -N -D localhost:8888 mob
  pkill -term iproxy
  rm -f `dirname $0`/safe.lock
fi
