#!/bin/bash

apt-add-list() {
  sourcesDir='/etc/apt/sources.list.d'
  if [ ! -f $sourcesDir/$1.list ]
  then
    echo $2 > $sourcesDir/$1.list
  fi
}

add-cgroup() {
  grep cgroup /etc/fstab > /dev/null
  if [ $? -ne 0 ]
  then
    echo -e "none\t/cgroup\tcgroup\tdefaults\t0\t0" >> /etc/fstab
  fi
  mkdir -p /cgroup
  mount /cgroup
}

#apt-get -y install aptitude
#aptitude -y install python-software-properties ppa-purge

aptitude -y purge empathy vim-tiny
aptitude install ppa-purge

apt-add-repository ppa:chromium-daily/stable
apt-add-repository ppa:sevenmachines/flash
apt-add-repository ppa:git-core/ppa
apt-add-repository ppa:pidgin-developers/ppa
apt-add-repository ppa:halcyonblue/synergy
apt-add-repository ppa:halcyonblue/ffmpeg
apt-add-repository ppa:halcyonblue/calibre
apt-add-list virtualbox 'deb http://download.virtualbox.org/virtualbox/debian maverick contrib'
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -


aptitude -y upgrade

aptitude -y install git git-svn
aptitude -y install chromium-browser flashplugin64-installer vim-gtk ctags ack-grep pidgin calibre
ln -s /usr/bin/ack-grep /usr/bin/ack
aptitude -y install openssh-server
aptitude -y install mysql-server libmysqlclient-dev

#aptitude -y install dput

aptitude -y install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev

# add-cgroup
# aptitude -y install lxc libvirt-bin

aptitude -y install synergy

aptitude -y install gtk-recordMyDesktop
