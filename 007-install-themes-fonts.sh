#!/bin/bash
set -e

#arc themes and icons
packer -S --noconfirm --noedit arc-gtk-theme 

# packer -S --noconfirm --noedit breeze-snow-cursor-theme	
packer -S --noconfirm --noedit breeze-default-cursor-theme

sudo pacman -S --noconfirm --needed noto-fonts

packer -S --noconfirm --noedit ttf-font-awesome-4

mkdir -p ~/.themes
cp -R .themes ~/

#install nerd fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
curl -fLo "Shure Tech Mono Nerd Font.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/ShareTechMono/complete/Shure%20Tech%20Mono%20Nerd%20Font%20Complete.ttf
fc-cache -fv
