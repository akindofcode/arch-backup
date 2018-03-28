#!/bin/bash

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

sudo pacman -S --noconfirm --needed powerline-fonts 

fc-cache

# To change the theme, go to the hidden file ~/.zshrc
# change this to ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel9k/powerlevel9k"
