#!/bin/bash
set -e

# update pacman packages
sudo pacman -Syu --noconfirm 

echo "### pacman packages updated ###"

# clean pacman cache
sudo pacman -Sc --noconfirm --clean --clean

echo "### pacman cache cleaned ###"

# update aur packages
packer -Syu --noconfirm --noedit --auronly

echo "### aur packages updated ###"
