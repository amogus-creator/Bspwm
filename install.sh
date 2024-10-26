#!/bin/bash

for pkg in bspwm alacritty sxhkd vim ly ttf-dejavu picom feh; do
    if ! pacman -Qs $pkg > /dev/null; then
        echo "Установка $pkg..."
        sleep 1
        sudo pacman -S --noconfirm $pkg || { echo "Ошибка установки $pkg"; exit 1; }
        sleep 1
    else
        echo "$pkg уже установлен."
        sleep 1
    fi

mkdir -p ~/.config/bspwm ~/.config/picom ~/.config/alacritty ~/wallpapers
sleep 1

echo "Перемещение конфигурационных файлов..."
mv ~/Downloads/bspwmrc ~/.config/bspwm
sleep 1
mv ~/Downloads/sxhkdrc ~/.config/bspwm
sleep 1
mv ~/Downloads/picom.conf ~/.config/picom
sleep 1
mv ~/Downloads/alacritty.yml ~/.config/alacritty
sleep 1
mv ~/Downloads/x.jpg ~/wallpapers
sleep 1
mv ~/Downloads/.xsession ~/
sleep 1
