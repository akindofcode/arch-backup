#!/bin/bash
set -e

sudo pacman -S --noconfirm --needed reflector

sudo reflector -l 100 -f 50 --sort rate --threads 5 --verbose --save /tmp/mirrorlist.new && rankmirrors -n 0 /tmp/mirrorlist.new > /tmp/mirrorlist && sudo cp /tmp/mirrorlist /etc/pacman.d

cat /etc/pacman.d/mirrorlist

sudo pacman -Syyu --noconfirm
