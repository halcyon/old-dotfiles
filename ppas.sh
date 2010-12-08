#!/bin/bash

apt-add-repository ppa:chromium-daily/stable
apt-add-repository ppa:sevenmachines/flash
apt-add-repository ppa:git-core/ppa

apt-get update

apt-get install -y chromium-browser flashplugin64-installer
apt-get install -y openssh-server vim-gtk build-essential

apt-get -y upgrade
