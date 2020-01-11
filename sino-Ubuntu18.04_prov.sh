#!/bin/bash

echo "start_provisioningi"
echo "Install apps"
echo ""

read -p "Do you start provisoning? [yes/no]: " start
if [ $start = "yes" ] || [ $start = "y" ] || [ $start = "YES" ] || [ $start = "Y" ]; then

	read -p "Do you want ssh setting? [yes/no]: " ssh

#Apt
	yes | sudo apt update
	yes | sudo apt upgrade
	yes | sudo apt dist-upgrade
	yes | sudo apt update

#HomeDirectory_eng
	LANG=C xdg-user-dirs-gtk-update

#ssh
	if [ $ssh = "yes" ] || [ $ssh = "y" ] || [ $ssh = "YES" ] || [ $ssh = "Y" ] || [ $ssh = "Yes" ]; then
		ssh-keygen -t rsa
		mv ~/id_rsa.pub ~/.ssh/authorized_keys
		chmod 600 ~/.ssh/authorized_keys
	fi

#Compile
	yes | sudo apt install gcc gauche
	yes | sudo apt install nodejs npm

#Editor
	yes | sudo apt install vim emacs24
	wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/Vim/.vimrc

#Tool
	yes | sudo apt install tree curl traceroute
	yes | sudo apt install git sl

#Ruby
	yes | sudo apt install gcc autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
	sudo git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	sudo chmod a=rwx .rbenv
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
	echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
	source .bash_profile
	sudo git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	rbenv install 2.4.1
	rbenv rehash
	rbenv global 2.4.1

#Apt-clean
	yes | sudo apt autoremove --purge
	yes | sudo apt clean

else
	exit
fi
