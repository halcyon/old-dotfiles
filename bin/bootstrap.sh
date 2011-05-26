#!/bin/bash

apt-add-list() {
  sourcesDir='/etc/apt/sources.list.d'
  if [ ! -f $sourcesDir/$1.list ]
  then
    echo $2 > $sourcesDir/$1.list
  fi
}

RVM_DEBS=(build-essential bison openssl libreadline6 libreadline6-dev curl
git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev
sqlite3 libxml2-dev libxslt1-dev autoconf libc6-dev libncurses5-dev)

WEB_DEBS=(firefox chromium-browser flashplugin64-installer)

VIM_DEBS=(vim-gtk ctags ack-grep)

SYSTEM_DEBS=(ppa-purge git-svn openssh-server synergy virtualbox-4.0)

MISC_DEBS=(pidgin calibre pdfedit gtk-recordMyDesktop)

dpkg-query -s aptitude > /dev/null 2>&1
if [ "$?" -eq 1 ]
then
  apt-get -y install aptitude
fi

dpkg-query -s empathy vim-tiny > /dev/null 2>&1
if [ "$?" -eq 1 ]
then
  aptitude -y purge empathy vim-tiny
fi

apt-add-repository ppa:git-core/ppa
apt-add-repository ppa:sevenmachines/flash
apt-add-list virtualbox 'deb http://download.virtualbox.org/virtualbox/debian natty contrib'
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

aptitude update
aptitude -y upgrade

dpkg-query -s ${WEB_DEBS[*]} > /dev/null 2>&1
if [ "$?" -eq 1 ]
then
  aptitude -y install ${WEB_DEBS[*]}
fi

dpkg-query -s ${VIM_DEBS[*]} > /dev/null 2>&1
if [ "$?" -eq 1 ]
then
  aptitude -y install ${VIM_DEBS[*]}
  ln -sf /usr/bin/ack-grep /usr/bin/ack
fi

dpkg-query -s ${SYSTEM_DEBS[*]} > /dev/null 2>&1
if [ "$?" -eq 1 ]
then
  aptitude -y install ${SYSTEM_DEBS[*]}
fi

dpkg-query -s ${MISC_DEBS[*]} > /dev/null 2>&1
if [ "$?" -eq 1 ]
then
  aptitude -y install ${SYSTEM_DEBS[*]}
fi

dpkg-query -s ${RVM_DEBS[*]} > /dev/null 2>&1
if [ "$?" -eq 1 ]
then
  aptitude -y install ${RVM_DEBS[*]}
fi


aptitude autoclean

if [ ! -d "/usr/local/rvm" ]
then
  bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
  . /etc/profile
fi

rvm list | grep ree > /dev/null 2>&1
if [ "$?" -eq 1 ]
then
  echo "gem: --no-rdoc --no-ri" > /etc/gemrc
  rvm install ree
  rvm --create --default ree@system
fi

gem list | grep vagrant > /dev/null 2>&1
if [ "$?" -eq 1 ]
then
  gem install vagrant
fi

gem list | grep veewee > /dev/null 2>&1
if [ "$?" -eq 1 ]
then
  gem install veewee
fi

gem list | grep chef > /dev/null 2>&1
if [ "$?" -eq 1 ]
then
  gem install chef
fi
