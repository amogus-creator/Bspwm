#!/bin/bash

for pkg in bspwm alacritty sxhkd vim ttf-dejavu picom feh gnome-keyring xorg-xsetroot xorg-xrandr; do
    if ! pacman -Qs $pkg > /dev/null; then
        echo "Установка $pkg..."
        sleep 1
        sudo pacman -S --noconfirm $pkg || { echo "Ошибка установки $pkg"; exit 1; }
        sleep 1
    else
        echo "$pkg уже установлен."
        sleep 1
    fi
done

mkdir -p ~/.config/bspwm ~/.config/picom ~/.config/kitty ~/wallpapers
sleep 1

mv ~/Downloads/bspwmrc ~/.config/bspwm
sleep 1
mv ~/Downloads/sxhkdrc ~/.config/bspwm
sleep 1
mv ~/Downloads/picom.conf ~/.config/picom
sleep 1
mv ~/Downloads/kitty.conf ~/.config/kitty
sleep 1
mv ~/Downloads/x.jpg ~/wallpapers
sleep 1

chmod +x ~/.config/bspwm/bspwmrc

chmod +x ~/.xsession

read -p "Хотите установить yay? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    sudo pacman -S --noconfirm git base-devel
    if [ ! -d "$HOME/.yay" ]; then
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        cd /tmp/yay
        makepkg -si --noconfirm
        cd ~
        rm -rf /tmp/yay
    fi
    echo "yay установлен."
else
    echo "Установка yay отменена."
    exit 1
fi

read -p "Хотите установить cava? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    yay -S --noconfirm cava
    echo "cava установлен."
else
    echo "Установка cava отменена."
fi

read -p "Хотите установить nvidia-settings? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    sudo pacman -S --noconfirm nvidia-settings
    echo "nvidia-settings установлен."
else
    echo "Установка nvidia-settings отменена."
fi

cd

yay -S --noconfirm minecraft-launcher

sudo pacman -S ly
systemctl enable ly.service

exit 0
