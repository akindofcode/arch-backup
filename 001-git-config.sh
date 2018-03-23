#!/bin/bash

git config --global user.name "akindofcode"
git config --global user.email "akindofcode@gmail.com"
sudo git config --system core.editor "vim"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=18000'
git config --global push.default simple
