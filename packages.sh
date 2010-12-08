#!/bin/bash

apt-add-repository ppa:chromium-daily/stable
apt-add-repository ppa:sevenmachines/flash
apt-add-repository ppa:git-core/ppa
apt-add-repository ppa:pidgin-developers/ppa

apt-get update
apt-get -y purge empathy vim-tiny
apt-get -y upgrade

apt-get -y install chromium-browser flashplugin64-installer vim-gtk pidgin
apt-get -y install openssh-server
apt-get -y install build-essential libreadline-dev libssl-dev
apt-get -y install lxc libvirt-bin
