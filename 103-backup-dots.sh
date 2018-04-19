 #!/bin/bash

mkdir -p dot-backup
cp -r ~/.config ~/Projects/arch-install/dot-backup/
cp ~/.Xresources ~/Projects/arch-install/dot-backup/
cp ~/.zshrc ~/Projects/arch-install/dot-backup/
cp -r ~/.toys ~/Projects/arch-install/dot-backup/
cp -r ~/.bin ~/Projects/arch-install/dot-backup/

echo "### dots backup done ###"
