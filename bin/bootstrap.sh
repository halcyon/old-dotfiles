#!/bin/bash

apt-add-list() {
  sourcesDir='/etc/apt/sources.list.d'
  if [ ! -f $sourcesDir/$1.list ]
  then
    echo $2 > $sourcesDir/$1.list
  fi
}

apt-get -y install aptitude
aptitude -y install ppa-purge

aptitude -y purge empathy vim-tiny

apt-add-repository ppa:git-core/ppa
apt-add-repository ppa:sevenmachines/flash
apt-add-list virtualbox 'deb http://download.virtualbox.org/virtualbox/debian natty contrib'
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

aptitude update
aptitude -y upgrade

aptitude -y install git git-svn
aptitude -y install firefox chromium-browser flashplugin64-installer vim-gtk ctags ack-grep pidgin calibre pdfedit
ln -sf /usr/bin/ack-grep /usr/bin/ack
aptitude -y install openssh-server

#rvm notes REE dependencies
aptitude -y install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev

aptitude -y install synergy
aptitude -y install virtualbox-4.0
aptitude -y install gtk-recordMyDesktop

bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
. /etc/profile
rvm list | grep ree > /dev/null 2>&1
if [ ! $? ]
then
  rvm install ree
fi
echo "gem: --no-rdoc --no-ri" > /etc/gemrc
rvm --create --default ree@system

#gem install vagrant chef


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
