#!/bin/bash
set -e

#arc themes and icons
packer -S --noconfirm --noedit arc-gtk-theme

# packer -S --noconfirm --noedit breeze-snow-cursor-theme	
packer -S --noconfirm --noedit breeze-default-cursor-theme

