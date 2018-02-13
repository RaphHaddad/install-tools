#!/usr/bin/env bash
echo "Installing software..."
sudo apt-get install -y git vim
echo "Installing software...finished"

setNumberVimFlag="set number"
if ! grep -q $setNumberVimFlag ~/.vimrc ; then
	echo "Adding Vim settings"
	echo "set number" >> ~/.vimrc
else
	echo "Vim settings already added"
fi
