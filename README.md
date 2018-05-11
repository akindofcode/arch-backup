# arch-install

Info on installing and ricing arch linux + dot files backup

Baseline: arch-linux-base-devel + openbox + lightdm +  rxvt-unicode + vim + git + ntfs-3g + nvidia

`git clone https://github.com/akindofcode/arch-install.git`

### lightdm not starting

[LightDM]
   logind-check-graphical=true
   
### Locale and keymap

uncomment line "en_GB.UTF-8" from /etc/locale.gen

`sudo locale-gen`

`sudo echo LANG=en_GB.UTF-8 > /etc/locale.conf`

`sudo localectl set-keymap es`

`sudo localetcl set-x11-keymap es`

### fix locale

`export LC_CTYPE=$LANG`

### nvidia

Fix screen tearing: in nvidia-settings 'Force Coposition Pipeline' (server display configuration - advanced)

<http://www.thelinuxrain.com/articles/got-tearing-with-proprietary-nvidia-try-this>

Disable second screen and save

### xrandr

#first screen only

`xrandr --output DVI-I-1 --auto --output DVI-D-0 --off`

#second screen only

`xrandr --output DVI-I-1 --off --output DVI-D-0 --auto`

#extend

`xrandr --output DVI-I-1 --auto --primary --output DVI-D-0 --auto --left-of`

#mirror

`xrandr --output DVI-I-1 --auto --output DVI-D-0 --auto --same-as DVI-I-1`

### openbox theming

Openbox wiki: http://openbox.org/wiki/Help:Contents#Configuration

Window border width:

Let's say you use the waldorf theme with openbox. You go to /usr/share/themes/waldorf/openbox-3/themerc and search the line

border.Width: 1

### wallpaper

`nitrogen ~/wallpapers`

convert to jpg

`mogrify -format jpg *.png`

### pipelines, toys...

/.bin

You can set your environment for Openbox in the ~/.config/openbox/environment.
Just add

`PATH="$HOME/.bin:$PATH"; export PATH`

### Fonts

Place windows fonts in /fonts/WindowsFonts before running script 005. Check vivaldi fonts.

New fonts cabn be installed to /.local/share/fonts or /usr/share/fonts

`fc-cache -fv`

### Tint2

<https://gitlab.com/o9000/tint2/blob/master/doc/tint2.md>

<https://github.com/addy-dclxvi/Tint2-Theme-Collections>

<https://github.com/adi1090x/my_dotfiles/tree/master/.config/tint2>


### Polybar

### Lemonbar

### i3block

### Zsh

### Silent boot

remove fsck from HOOKS=(...) in /etc/mkinitpcio.conf

`# mkinitcpio -p linux`

GRUB -> e -> quiet vga=current vt.global_cursor_default=0 udev.log_priority=3

add to /etc/default/grub:

`GRUB_CMDLINE_LINUX_DEFAULT="nvidia-drm.modeset=1 quiet vga=current vt.global_cursor_default=0 udev.log_priority=3"`

regenerate grub.cfg file:

`# grub-mkconfig -o /boot/grub/grub.cfg`

### Hide Grub (not for dual boot)

packer -S --noedit grub-silent 

- Reinstall GRUB first:
  
`sudo grub-install --target=i386-pc /dev/sdf`
 
- Then; look at "/etc/default/grub.silent" sample file
  and make necessary changes to "/etc/default/grub".
 
`GRUB_DEFAULT=0`

`GRUB_TIMEOUT=0`

`GRUB_RECORDFAIL_TIMEOUT=$GRUB_TIMEOUT`

`GRUB_CMDLINE_LINUX_DEFAULT="nvidia-drm.modeset=1 quiet loglevel=3 vga=current rd.systemd.show_status=false vt.global_cursor_default=0 udev.log_priority=3"`

- regenerate grub.cfg file:

`# grub-mkconfig -o /boot/grub/grub.cfg`

### Maintenance

`du /var/cache/pacman/pkg -sh`

`pacman -Sc`

`pacman -Scc`

### Music

Beets configured

play [query] to create playlist and play
W-c  -> cava
W-l  -> show lyrics to current song

Plugins: 

copyartifacts

<https://github.com/sbarakat/beets-copyartifacts#development>

if copyartifacts doesn't work replace /usr/lib/python3.6/site-packages/beetsplug/copyartifacts.py
with https://raw.githubusercontent.com/sbarakat/beets-copyartifacts/master/beetsplug/copyartifacts.py

fetchart

<http://beets.readthedocs.io/en/v1.4.6/plugins/fetchart.html>

`beet fetchart -f`

Add Music to /etc/fstab

/dev/sdd1 /run/media/chema/Music ntfs-3g uid=chema gid=users 0 0

### mps-youtube

Once you install mps-youtube, launch it with:

$ mpsyt
Then type h to see the options. For quick usage, you can just do:

/[query]
to search for something, then type the number ID of the video to listen to its sound, or type:

i [video-number]
to see its information, and type:

d [video-number]
to download it. If just listening is not enough for you, here is the trick:

set player mpv
set show_video True
set max_res 1080
set fullscreen True
