#!/bin/bash

basebox=$1
date=$(date +%m-%d-%Y)
version=$(head definitions/${basebox}/postinstall.sh 2>/dev/null | grep \$Rev: | ruby -ne 'puts $_.scan(/\$Rev: (\S{6}) \$/)[0].to_s')

if [ ! -z "${version}" ]
then
  boxname="${basebox}-${date}-${version}"
  boxlist=`vagrant box list`
  echo -e ${boxlist} | grep "${boxname}" > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    echo "BaseBox ${boxname} already exists!"
    exit 1
  else
    vagrant basebox build "${basebox}"
    vagrant basebox validate "${basebox}"
    if [ $? -eq 0 ]
    then
      exit "Error: BaseBox Validation of ${basebox} failed"
    fi
  fi
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
