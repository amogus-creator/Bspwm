#!/bin/bash

cd

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

mv ~/Downloads/bspwmrc ~/.config/bspwm

mv ~/Downloads/sxhkdrc ~/.config/bspwm

mv ~/Downloads/picom.conf ~/.config/picom

mv ~/Downloads/kitty.conf ~/.config/kitty

mv ~/Downloads/x.jpg ~/wallpapers

mv ~/Downloads/.xsession ~/

chmod +x ~/.config/bspwm/bspwmrc

chmod +x ~/.xsession

read -p "Do you want to install yay? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    sudo pacman -S --noconfirm base-devel
    if [ ! -d "$HOME/.yay" ]; then
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        cd /tmp/yay
        makepkg -si --noconfirm
        cd ~
        rm -rf /tmp/yay
    fi
    echo "yay is installed."
else
    echo "The installation of yay has been canceled."
fi

read -p "Do you want to install cava? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    yay -S --noconfirm cava
    echo "cava is installed."
else
    echo "The installation of cava has been canceled."
fi

read -p "Do you want to install nvidia-settings? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    sudo pacman -S --noconfirm nvidia-settings
    echo "nvidia-settings is installed."
else
    echo "The installation nvidia-settings has been canceled."
fi

read -p "Do you want to install minecraft-launcher? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    yay -S --noconfirm minecraft-launcher
    echo "minecraft-launcher is installed."
else
    echo "The installation minecraft-launcher has been canceled."
fi

sudo pacman -S --noconfirm ly

systemctl enable ly.service

read -p "Do you want to reboot? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    sudo reboot
else
    echo "The reboot has been canceled."
fi

exit 0
