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

sudo pacman -S --noconfirm --needed reflector

sudo reflector -l 100 -f 50 --sort rate --threads 5 --verbose --save /tmp/mirrorlist.new && rankmirrors -n 0 /tmp/mirrorlist.new > /tmp/mirrorlist && sudo cp /tmp/mirrorlist /etc/pacman.d

cat /etc/pacman.d/mirrorlist

# backup pacman.conf
sudo cp /etc/pacman.conf /etc/pacman.conf.old

# add herecura repo (for vivaldi)

sudo sed -i /etc/pacman.conf -e '$a\\n[herecura]\nServer = http://repo.herecura.be/$repo/$arch'

# add sublime text repo

curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg

# Stable (sublime-text-dev - name of package: sublime-text)
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
# Dev (Nightly build - needs license)
# echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/dev/x86_64" | sudo tee -a /etc/pacman.conf

sudo pacman -Syyu --noconfirm