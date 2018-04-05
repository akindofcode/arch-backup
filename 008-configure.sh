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

#copy pipelines to /usr/bin
sudo cp .bin/al-* /usr/bin/
sudo chown root:root /usr/bin/al-*

#move al-include.cfg to /usr/lib/archlabs/common
sudo mkdir -p /usr/lib/archlabs/common
sudo mv /usr/bin/al-include.cfg /usr/lib/archlabs/common/

#copy local pipelines (can be edited)
mkdir -p ~/.bin
cp /usr/bin/al-* ~/.bin/

#copy toys
mkdir -p ~/.toys
cp .toys/* ~/.toys/

#copy vivaldi conf - check for updates at https://github.com/Tiamarth/Arc-for-Vivaldi
sudo cp vivaldi/*.css /opt/vivaldi/resources/vivaldi/style
sudo cp -R vivaldi/arc /opt/vivaldi/resources/vivaldi/style
sudo cp vivaldi/browser.html /opt/vivaldi/resources/vivaldi/

echo "!!! You need to modify the Vivaldi Theme by hand !!!"
echo "Check values at https://github.com/Tiamarth/Arc-for-Vivaldi"

echo "Reconfigure openbox and generate new menu"
