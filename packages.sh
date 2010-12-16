#!/bin/bash

apt-add-list() {
  sourcesDir='/etc/apt/sources.list.d'
  if [ ! -f $sourcesDir/$1.list ]
  then
    echo $2 > $sourcesDir/$1.list
  fi
}

apt-add-repository ppa:chromium-daily/stable
apt-add-repository ppa:sevenmachines/flash
apt-add-repository ppa:git-core/ppa
apt-add-repository ppa:pidgin-developers/ppa
apt-add-repository ppa:halcyonblue/synergy
apt-add-repository ppa:halcyonblue/ffmpeg
apt-add-list virtualbox 'deb http://download.virtualbox.org/virtualbox/debian maverick non-free'
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -


apt-get update
apt-get -y purge empathy vim-tiny
apt-get -y upgrade

apt-get -y install git git-svn
apt-get -y install chromium-browser flashplugin64-installer vim-gtk ctags ack-grep pidgin
ln -s /usr/bin/ack-grep /usr/bin/ack
apt-get -y install openssh-server
apt-get -y install build-essential libreadline-dev libssl-dev dput
apt-get -y install lxc libvirt-bin virtualbox-3.2
apt-get -y install synergy
