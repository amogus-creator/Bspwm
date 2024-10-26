#!/bin/bash

echo "Установка необходимых зависимостей... ( xorg-server, bspwm, alacritty, sxhkd, vim, ly, picom, zsh, feh)"
sudo pacman -S --noconfirm xorg-server bspwm alacritty sxhkd vim ly picom zsh feh

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

systemctl enable ly.service

echo "Создание директорий для конфигурации... ( ~/.config/bspwm )"
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/picom

echo "Копирование конфигурационных файлов..."
mv ~/Downloads/bspwm-example/bspwmrc ~/.config/bspwm/
mv ~/Downloads/bspwm-example/sxhkdrc ~/.config/bspwm/
mv ~/Downloads/bspwm-example/alacritty.toml ~/.config/alacritty/
mv ~/Downloads/bspwm-example/picom.conf ~/.config/picom/
mv ~/Downloads/bspwm-example/.xsession ~/

chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.xsession

echo "Установка завершена! Пожалуйста, перезапустите сессию или запустите 'bspwm' для начала работы."
