#!/bin/bash

#copy openbox configuration
mkdir -p ~/.config/openbox
mkdir -p ~/.config/obemenu-generator
cp .config/openbox/* ~/.config/openbox
cp .config/obmenu-generator/* ~/.config/obmenu-generator

#copy nitrogen configuration
mkdir -p ~/.config/nitrogen
cp .config/nitrogen/* ~/.config/nitrogen

#copy termite configuration
mkdir -p ~/.config/termite
cp .config/termite/* ~/.config/termite

#copy pipelines to /usr/bin
sudo cp pipelines/al-* /usr/bin
sudo chown root:root /usr/bin/al-*

#copy vivaldi conf - check for updates at https://github.com/Tiamarth/Arc-for-Vivaldi
sudo cp .config/vivaldi/*.css /opt/vivaldi/resources/vivaldi/style
sudo cp -R .config/vivaldi/arc /opt/vivaldi/resources/vivaldi/style
sudo cp .config/vivaldi/browser.html /opt/vivaldi/resources/vivaldi/

echo "!!! You need to modify the Vivaldi Theme by hand !!!"
echo "Check values at https://github.com/Tiamarth/Arc-for-Vivaldi"

echo "Reconfigure openbox and generate new menu"
