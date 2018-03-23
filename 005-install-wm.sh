#!/bin/bash

sudo pacman -S --needed --noconfirm lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

systemctl enable lightdm.service

packer -S --noconfirm --noedit openbox-patched

