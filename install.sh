#!/bin/bash

sudo pacman -S bspwm alacritty sxhkd vim ly ttf-dejavu

sudo mkdir ~/.config/bspwm

sudo mv ~/Downloads/bspwmrc ~/.config/bspwm/
sudo mv ~/Downloads/sxhkdrc ~/.config/bspwm/
sudo mv ~/Downloads/.xsession ~/

sudo chmod +x ~/.xsession
sudo chmod +x ~/.config/bspwm/bspwmrc
