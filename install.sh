#!/bin/bash

echo "Установка необходимых зависимостей... ( xorg-server, bspwm, alacritty, sxhkd, vim, ly, picom, zsh, feh)"
sudo pacman -S --noconfirm xorg-server xorg-xrandr bspwm alacritty sxhkd vim ly picom zsh feh

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

systemctl enable ly.service

echo "Создание директорий для конфигурации... ( ~/.config/bspwm )"
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/picom
mkdir -p ~/wallpapers

echo "Копирование конфигурационных файлов..."
mv ~/Downloads/bspwm-example/bspwmrc ~/.config/bspwm/
mv ~/Downloads/bspwm-example/sxhkdrc ~/.config/bspwm/
mv ~/Downloads/bspwm-example/alacritty.toml ~/.config/alacritty/
mv ~/Downloads/bspwm-example/picom.conf ~/.config/picom/
mv ~/Downloads/bspwm-example/.xsession ~/

read -p "Хотите установить разрешение экрана 1920x1080 с частотой 144 Гц на HDMI-0? (Y/n): " choice
choice=${choice:-Y}

if [[ "$choice" == "Y" || "$choice" == "y" ]]; then
    echo "xrandr --output HDMI-0 --mode 1920x1080 --rate 144" >> ~/.xsession
elif [[ "$choice" == "N" || "$choice" == "n" ]]; then
    echo "Установка разрешения экрана пропущена."
else
    echo "Неверный ввод. Установка разрешения экрана отклонена."
fi

chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.xsession

echo "Установка завершена! Пожалуйста, перезапустите сессию или запустите 'bspwm' для начала работы."
