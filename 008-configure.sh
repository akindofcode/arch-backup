#!/bin/bash

#copy openbox configuration
cp -R .config ~/.config

#copy pipelines to /usr/bin
sudo cp pipelines/al-* /usr/bin
sudo chown root:root /usr/bin/al-*

echo "Reconfigure openbox and generate new menu"
