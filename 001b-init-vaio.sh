#!/bin/bash

# configure git
git config --global user.name "akindofcode"
git config --global user.email "akindofcode@gmail.com"
sudo git config --system core.editor "vim"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=18000'
git config --global push.default simple

# fix mount problems
sudo cp init/00-mount-internal.rules /etc/polkit-1/rules.d/
sudo chown root:root /etc/polkit-1/rules.d/00-mount-internal.rules

# install wifi drivers
sudo pacman -S --noconfirm --needed broadcom-wl-dkms
#sudo mkinitcpio -p linux

# fix time
sudo pacman -S --noconfirm --needed ntp
sudo ntpd -qg
hwclock --systohc

# install intel microcode
sudo pacman -S --noconfirm --needed intel-ucode
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "use nmtui to configure wifi connection"
echo "Please restart to apply changes"