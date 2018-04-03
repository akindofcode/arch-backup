#!/bin/bash

# configure git
git config --global user.name "akindofcode"
git config --global user.email "akindofcode@gmail.com"
sudo git config --system core.editor "vim"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=18000'
git config --global push.default simple

# blacklist nouveau module
sudo cp init/blacklist.conf /etc/modprobe.d/
sudo chown root:root /etc/modprobe.d/blacklist.conf


#nvidia-settings
sudo pacman -S --needed --noconfirm nvidia-settings

# fix big fonts
sudo nvidia-xconfig --no-use-edid-dpi

# fix mount problems
sudo cp init/00-mount-internal.rules /etc/polkit-1/rules.d/
sudo chown root:root /etc/polkit-1/rules.d/00-mount-internal.rules

echo "Please restart to apply changes"
