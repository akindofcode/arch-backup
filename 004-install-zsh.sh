#!/bin/bash

sudo pacman -S --noconfirm --needed zsh zsh-completions

sudo pacman -S --noconfirm --needed zsh-syntax-highlighting

# install oh-my-zsh from github
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

sudo pacman -S --noconfirm --needed powerline-fonts 

fc-cache

#packer -S --noconfirm --noedit nerd-fonts-complete

# To change the theme, go to the hidden file ~/.zshrc
# change this to ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel9k/powerlevel9k"

#packer -S --noconfirm --noedit command-not-found

sudo chsh $USER -s /bin/zsh

echo "Log off or reboot to see the change in your terminal".
