#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

function doIt() {
	rsync \
		--exclude ".git/" \
		--exclude ".gitignore" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "setup" \
		--exclude "themes" \
		-av --no-perms --dry-run . ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi

read -p "Install packages etc...? (y/n) " -n 1 REPLY
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	setup/brew.sh;
fi

read -p "Install extras? (y/n) " -n 1 REPLY
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	setup/extra.sh;
fi

read -p "Run Mountain Lion customization? (y/n) " -n 1 REPLY
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	setup/osx-mlion.sh;
fi

unset doIt
source ~/.bash_profile
