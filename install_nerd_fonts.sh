#!/usr/bin/env bash
mkdir -p ~/fonts
cd ~/fonts

if [ "$(uname)" == "Darwin"  ]; then
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux"  ]; then
  sudo apt-get install fontconfig
  sudo apt-get install fonts-hack-ttf -y
fi
