#!/bin/bash

# firefox
sudo pacman -S firefox

# yay!
sudo pacman -S yay --noconfirm

# file manager (midnight-commander)
yay -S mc

# python
echo 'alias python=python3' >> ~/.zshrc
source ~/.zshrc

# c++
sudo pacman -S base-devel

# jdk
yay -S jdk --noconfirm

# NvChad
yay -S nvchad