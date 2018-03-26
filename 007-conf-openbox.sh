#!/bin/bash
set -e

#obconf is gtk2 and not needed if lxappearance-obconf-gtk3 installed ?? 
# sudo pacman -S --noconfirm --needed obconf

sudo pacman -S --noconfirm --needed lxappearance-gtk3 lxappearance-obconf-gtk3 

sudo pacman -S --noconfirm --needed neofetch

sudo pacman -S --noconfirm --needed oblogout

sudo pacman -S --noconfirm --needed tint2 dmenu feh nitrogen rofi xfce4-appfinder gmrun numlockx xfce4-notifyd volumeicon compton

packer -S --noconfirm --noedit obmenu3

packer -S --noconfirm --noedit obmenu-generator

#packer -S --noconfirm --noedit yad

packer -S --noconfirm --noedit obkey

packer -S --noconfirm --noedit i3lock-color-git

packer -S --noconfirm --noedit polybar-git

# copy default openbox configuration to ~/.config
cp -R /etc/xdg/openbox ~/.config

echo "tint2 &" >> ~/.config/openbox/autostart
echo "nitrogen --restore & #restore the background chosen with nitrogen" >> ~/.config/openbox/autostart
echo "compton -b -c --config ~/.config/compton/compton.conf &" >> ~/.config/openbox/autostart
echo "volumeicon &" >> ~/.config/openbox/autostart
echo "numlockx &" >> ~/.config/openbox/autostart
