#!/bin/bash

apt-add-repository ppa:chromium-daily/stable
apt-add-repository ppa:sevenmachines/flash
apt-add-repository ppa:git-core/ppa
apt-add-repository ppa:pidgin-developers/ppa

apt-get update
apt-get purge empathy vim-tiny
apt-get -y upgrade

apt-get install -y chromium-browser flashplugin64-installer
apt-get install -y openssh-server vim-gtk build-essential
apt-get install -y lxc libvirt-bin
