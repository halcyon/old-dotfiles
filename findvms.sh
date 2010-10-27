#!/bin/bash
IFS='
'

IPS=`ifconfig -a | grep "inet addr" | ruby -e 'ARGF.each_line { |line| print line[/addr:([0-9]+\.[0-9]+\.[0-9]+)/, 1]+".0/24\n" }'`
VMS=`VBoxManage list runningvms | grep "^\""`

for SUBNET in $IPS
do
  nmap -sP $SUBNET  > /dev/null 2>&1
done

for VM in $VMS
do
  MACHINE=`echo $VM |ruby -e 'puts ARGF.readline[/"(([A-z]|[0-9])+)"/, 1]'`
  MAC=`VBoxManage showvminfo "$MACHINE"| grep MAC: |ruby -e 'puts ARGF.readline[/MAC: (([0-9]|[A-Z])+)/, 1].downcase.scan(/(..)/).join(":")'`
  arp -vn | grep $MAC
done
