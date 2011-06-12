#!/bin/bash

basebox=$1
date=$(date +%m-%d-%Y)
version=$(head definitions/${basebox}/postinstall.sh | grep \$Rev: | ruby -ne 'puts $_.scan(/\$Rev: (\S{6}) \$/)[0].to_s')

if [ ! -z "${version}" ]
then
  boxname="${basebox}-${date}-${version}"
  if [ ! -f "${boxname}.box" ]
  then
    echo "Packaging ${boxname}"
    vagrant package --base "${basebox}" --output "${boxname}.box"
  fi
  vagrant box add "${boxname}" "${boxname}.box"
else
  echo "Basebox not found"
  exit 1
fi
