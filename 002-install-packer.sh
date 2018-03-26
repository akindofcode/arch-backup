#!/bin/bash
set -e

sudo pacman -S --noconfirm --needed grep sed bash curl pacman jshon expac wget

[ -d /tmp/packer ] && rm -rf /tmp/packer

mkdir /tmp/packer

wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer

mv PKGBUILD\?h\=packer /tmp/packer/PKGBUILD

cd /tmp/packer

makepkg -i /tmp/packer --noconfirm

[ -d /tmp/packer ] && rm -rf /tmp/packer

# Just checking if installation was successful
if pacman -Qi packer &> /dev/null; then

echo "### packer has been installed ####"

else

echo "!!! packer has NOT been installed !!!"

fi
