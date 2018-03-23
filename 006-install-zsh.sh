#!/bin/bash

sudo pacman -S --noconfirm --needed zsh zsh-completions

sudo pacman -S --noconfirm --needed zsh-theme-powerlevel9k

sudo pacman -S --noconfirm --needed zsh-syntax-highlighting

# This is what you should do to enjoy the many themes.
# go find the hidden .zshrc file and look for ZSH_THEME="robbyrussell" (CTRL+H to find hidden files)
# change this to ZSH_THEME="random"

packer -S --noconfirm --noedit command-not-found

sudo chsh $USER -s /bin/zsh

echo "Log off or reboot to see the change in your terminal".
