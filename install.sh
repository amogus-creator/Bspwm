#!/bin/bash

echo "Установка необходимых зависимостей... ( xorg-server, bspwm, alacritty, sxhkd, vim, ly, picom, feh, ttf-dejavu)"
sudo pacman -S --noconfirm bspwm alacritty sxhkd vim ly picom feh ttf-dejavu

echo "Создание директорий для конфигурации... ( ~/.config/bspwm )"
mkdir ~/.config/bspwm
mkdir ~/.config/alacritty
mkdir ~/.config/picom
mkdir ~/wallpapers

echo "Копирование конфигурационных файлов..."
mv ~/Downloads/bspwmrc ~/.config/bspwm/
mv ~/Downloads/sxhkdrc ~/.config/bspwm/
mv ~/Downloads/alacritty.toml ~/.config/alacritty/
mv ~/Downloads/picom.conf ~/.config/picom/
mv ~/Downloads/.xsession ~/
mv ~/Downloads/x.jpg ~/wallpapers

systemctl enable ly.service

chmod +x ~/.xsession
chmod +x ~/.config/bspwm/bspwmrc
