#!/bin/bash
set -e

#obconf is gtk2 and not needed if lxappearance-obconf-gtk3 installed ?? 
# sudo pacman -S --noconfirm --needed obconf

sudo pacman -S --noconfirm --needed lxappearance-gtk3 lxappearance-obconf-gtk3 

sudo pacman -S --noconfirm --needed neofetch

sudo pacman -S --noconfirm --needed oblogout

packer -S --noconfirm --noedit obmenu3

packer -S --noconfirm --noedit obmenu-generator

#packer -S --noconfirm --noedit yad

packer -S --noconfirm --noedit obkey

packer -S --noconfirm --noedit i3lock-color-git

# copy default openbox configuration to ~/.config
cp -R /etc/xdg/openbox ~/.config
