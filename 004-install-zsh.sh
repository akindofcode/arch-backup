#!/bin/bash

sudo pacman -S --noconfirm --needed zsh zsh-completions

sudo pacman -S --noconfirm --needed zsh-syntax-highlighting

# install oh-my-zsh from github
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
