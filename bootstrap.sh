#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git checkout CeryDotfiles;
git pull origin CeryDotfiles;
git submodule update --init --recursive;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
	sh ~/.vim_runtime/install_awesome_vimrc.sh;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
sudo apt-get install -y fonts-powerline python-pip
pip install powerline-shell
source ~/.bash_profile

