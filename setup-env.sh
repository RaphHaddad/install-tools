#!/usr/bin/env bash

echo "Installing software..."
sudo apt-get update
sudo apt-get install -y git vim xsel gcc make perl python curl texmaker
echo "Installing software...finished"

setNumberVimFlag="set number"
if ! grep -q $setNumberVimFlag ~/.vimrc ; then
	echo "Adding Vim settings"
	echo "set number" >> ~/.vimrc
else
	echo "Vim settings already added"
fi

echo "remove existing ssh key if exists..."
rm ~/.ssh/id_rsa
rm ~/.ssh/id_rsa.pub
echo "remove existing ssh key if exists...finished"

echo "generate ssh key..."
ssh-keygen -f ~/.ssh/id_rsa -t rsa
cat ~/.ssh/id_rsa.pub  | xsel -ib
echo "generate ssh key...finished"

echo "public key is on clipboard."
