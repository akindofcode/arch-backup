#!/bin/bash

sudo pacman -S --needed --noconfirm lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

systemctl enable lightdm.service

packer -S --noconfirm --noedit openbox-patched

# copy default openbox configuration to ~/.config
cp -R /etc/xdg/openbox ~/.config
