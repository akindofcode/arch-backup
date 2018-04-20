 #!/bin/bash

mkdir -p dot-backup
cp -r ~/.config dot-backup/
cp ~/.Xresources dot-backup/
cp ~/.zshrc dot-backup/
cp -r ~/.toys dot-backup/
cp -r ~/.bin dot-backup/

rm -rf dot-backup/.config/vivaldi/

echo "### dots backup done ###"
