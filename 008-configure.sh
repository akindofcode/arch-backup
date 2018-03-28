#!/bin/bash

#copy openbox configuration
mkdir -p ~/.config/openbox
mkdir -p ~/.config/obemenu-generator
cp .config/openbox/* ~/.config/openbox
cp .config/obmenu-generator/* ~/.config/obmenu-generator

#copy nitrogen configuration
mkdir -p ~/.config/nitrogen
cp .config/nitrogen/* ~/.config/nitrogen

#copy pipelines to /usr/bin
sudo cp pipelines/al-* /usr/bin
sudo chown root:root /usr/bin/al-*

echo "Reconfigure openbox and generate new menu"
