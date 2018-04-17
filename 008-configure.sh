#!/bin/bash

#copy openbox configuration
mkdir -p ~/.config/openbox
mkdir -p ~/.config/obmenu-generator
cp .config/openbox/* ~/.config/openbox/
cp .config/obmenu-generator/* ~/.config/obmenu-generator/

#copy oblogout configuration 
mkdir -p /.config/oblogout
cp .config/oblogout/* /.config/oblogout/

#copy compton configuration
mkdir -p ~/.config/compton
cp .config/compton/* ~/.config/compton/

#copy tint2 configuration
mkdir -p ~/.config/tint2
cp .config/tint2/* ~/.config/tint2/

#copy pcmanfm configuration
mkdir -p ~/.config/pcmanfm/default
cp .config/pcmanfm/default/* ~/.config/pcmanfm/default/

#copy neofetch configuration
mkdir -p ~/.config/neofetch
cp ./config/neofetch/* ~/.config/neofetch/

# copy .profile

# copy .Xresources
cp .Xresources ~/

# copy .zshrc
cp .zshrc ~/

#copy nitrogen configuration
mkdir -p ~/wallpapers
cp wallpapers/* ~/wallpapers/

mkdir -p ~/.config/nitrogen
cp .config/nitrogen/* ~/.config/nitrogen/

#copy termite configuration
mkdir -p ~/.config/termite
cp .config/termite/* ~/.config/termite/

#copy termite configuration
mkdir -p ~/.config/ranger
cp .config/ranger/* ~/.config/ranger/

#copy pipelines and scripts to ~/.bin
mkdir -p ~/.bin
sudo cp .bin/* ~/.bin/

#copy al-include.cfg to /usr/lib/archlabs/common
sudo mkdir -p /usr/lib/archlabs/common
sudo cp .bin/al-include.cfg /usr/lib/archlabs/common/
sudo chown root:root /usr/bin/al-include.cfg

#copy toys
mkdir -p ~/.toys
cp .toys/* ~/.toys/

# mpdsonglisten service
mkdir -p /.config/systemd/user/
cp .config/systemd/user/mpdsonglisten.service ~/.config/systemd/user/
systemctl --user enable mpdsonglisten
systemctl --user start mpdsonglisten

#copy vivaldi conf - check for updates at https://github.com/Tiamarth/Arc-for-Vivaldi
sudo cp vivaldi/*.css /opt/vivaldi/resources/vivaldi/style
sudo cp -R vivaldi/arc /opt/vivaldi/resources/vivaldi/style
sudo cp vivaldi/browser.html /opt/vivaldi/resources/vivaldi/

echo "!!! You need to modify the Vivaldi Theme by hand !!!"
echo "Check values at https://github.com/Tiamarth/Arc-for-Vivaldi"

echo "Reconfigure openbox and generate new menu"
