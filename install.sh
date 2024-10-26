#!/bin/bash

echo "Установка необходимых зависимостей... ( xorg-server, bspwm, alacritty, sxhkd, git, vim )"
sudo pacman -S --noconfirm xorg-server bspwm alacritty sxhkd git vim

echo "Создание директорий для конфигурации... ( ~/.config/bspwm )"
mkdir -p ~/.config/bspwm

echo "Клонирование конфигурационных файлов... ( bspwmrc, sxhkdrc, .xsession )"
git clone ССЫЛКА ~/Downloads

echo "Копирование конфигурационных файлов..."
mv ~/Downloads ~/.config/bspwm/bspwmrc
mv ~/Downloads ~/.config/bspwm/sxhkdrc

chmod +x ~/.config/bspwm/bspwmrc

echo "Установка завершена! Пожалуйста, перезапустите сессию или запустите 'bspwm' для начала работы."
