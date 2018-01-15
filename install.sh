#!/bin.bash -exv


: "Install Homebrew" 
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


: "Install npm"
brew install npm


: "Install pip"
sudo easy_install pip


: "Install NeoVim"
brew install nvim
