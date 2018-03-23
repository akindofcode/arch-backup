#!/bin/bash

sudo pacman -S --noconfirm --needed intel-ucode

sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "### intel microcode updates isntalled ###"
