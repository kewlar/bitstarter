#!/bin/bash
# Provisioning script for Coursera Startup Engineering box.

sudo apt-get update

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
#curl https://raw.github.com/creationix/nvm/master/install.sh | sh

sudo apt-get install -y nodejs npm

# Load nvm and install latest production node
#source $HOME/.nvm/nvm.sh
#nvm install v0.10.12
#nvm use v0.10.12

# sudo apt-get install python-software-properties python g++ make
# sudo add-apt-repository ppa:chris-lea/node.js
# sudo apt-get update
# sudo apt-get install nodejs
# sudo npm install --global --verbose express

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/startup-class/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .
