#!/bin/bash

apt-add-list() {
  sourcesDir='/etc/apt/sources.list.d'
  if [ ! -f $sourcesDir/$1.list ]
  then
    echo $2 > $sourcesDir/$1.list
  fi
}

apt-get -y install aptitude

aptitude -y purge empathy vim-tiny

apt-add-repository ppa:git-core/ppa
apt-add-repository ppa:sevenmachines/flash
apt-add-list virtualbox 'deb http://download.virtualbox.org/virtualbox/debian natty contrib'
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

aptitude update
aptitude -y upgrade

aptitude -y install ppa-purge git git-svn openssh-server firefox chromium-browser flashplugin64-installer vim-gtk ctags ack-grep pidgin calibre pdfedit
ln -sf /usr/bin/ack-grep /usr/bin/ack

#rvm notes REE dependencies
aptitude -y install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev

aptitude -y install synergy virtualbox-4.0 gtk-recordMyDesktop

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

#We no longer use LXC
#add-cgroup() {
#  grep cgroup /etc/fstab > /dev/null
#  if [ $? -ne 0 ]
#  then
#    echo -e "none\t/cgroup\tcgroup\tdefaults\t0\t0" >> /etc/fstab
#  fi
#  mkdir -p /cgroup
#  mount /cgroup
#}

# add-cgroup
# aptitude -y install lxc libvirt-bin

#Needed for publishing to a PPA
#aptitude -y install dput
