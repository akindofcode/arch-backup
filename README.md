# arch-install

Info on installing and ricing arch linux + dot files backup

Baseline: clean arch install + lightdm, openbox, git, vim, rxvt-unicode, ntfs-3g, nvidia

`git clone https://github.com/akindofcode/arch-install.git`

001-init

nvidia-settings
Fix screen tearing: in nvidia-settings 'Force Coposition Pipeline (server display configuration - advanced)
http://www.thelinuxrain.com/articles/got-tearing-with-proprietary-nvidia-try-this

### xrandr

#first screen only

`xrandr --output DVI-I-1 --auto --output DVI-D-0 --off`

#second screen only

`xrandr --output DVI-I-1 --off --output DVI-D-0 --auto`

#extend

`xrandr --output DVI-I-1 --auto --primary --output DVI-D-0 --auto --left-of`

#mirror

`xrandr --output DVI-I-1 --auto --output DVI-D-0 --auto --same-as DVI-I-1`


### wallpaper

`nitrogen ~/wallpapers`

### pipelines, toys...

/.bin

You can set your environment for Openbox in the ~/.config/openbox/environment.
Just add
PATH="$HOME/.bin:$PATH"; export PATH

### Tint2

https://gitlab.com/o9000/tint2/blob/master/doc/tint2.md

https://github.com/addy-dclxvi/Tint2-Theme-Collections

https://github.com/adi1090x/my_dotfiles/tree/master/.config/tint2

### Zsh

### i3block

### Polybar

### Microcode updates

### Silent boot
