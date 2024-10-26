#!/bin/bash

echo "Установка необходимых зависимостей... ( xorg-server, bspwm, alacritty, sxhkd, git, vim, ly)"
sudo pacman -S --noconfirm xorg-server bspwm alacritty sxhkd git vim ly

systemctl enable ly.service

echo "Создание директорий для конфигурации... ( ~/.config/bspwm )"
mkdir -p ~/.config/bspwm

echo "Копирование конфигурационных файлов..."
mv ~/Downloads/bspwm-example/bspwmrc ~/.config/bspwm/
mv ~/Downloads/bspwm-example/sxhkdrc ~/.config/bspwm/
mv ~/Downloads/bspwm-example/.xsession ~/

chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.xsession

echo "Установка завершена! Пожалуйста, перезапустите сессию или запустите 'bspwm' для начала работы."
