#!/bin/bash
set -e

# copy default openbox configuration to ~/.config
cp -R /etc/xdg/openbox ~/.config

sudo pacman -S --noconfirm --needed obconf lxappearance-gtk3 lxappearance-obconf-gtk3 neofetch oblogout

sudo pacman -S --noconfirm --needed tint2 dmenu feh nitrogen rofi xfce4-appfinder gmrun numlockx xfce4-notifyd volumeicon compton

packer -S --noconfirm --noedit obmenu3

packer -S --noconfirm --noedit obmenu-generator

packer -S --noconfirm --noedit obkey

packer -S --noconfirm --noedit mons

#packer -S --noconfirm --noedit yad

#packer -S --noconfirm --noedit i3lock-color-git

#packer -S --noconfirm --noedit polybar-git

echo "compton -b -c --config ~/.config/compton/compton.conf &" >> ~/.config/openbox/autostart
echo "nitrogen --restore & #restore the background chosen with nitrogen" >> ~/.config/openbox/autostart
echo "volumeicon &" >> ~/.config/openbox/autostart
echo "numlockx &" >> ~/.config/openbox/autostart
echo "tint2 &" >> ~/.config/openbox/autostart
