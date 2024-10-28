#!/bin/bash

cd ~/Downloads

for pkg in bspwm kitty sxhkd vim ttf-dejavu picom feh gnome-keyring xorg-xsetroot xorg-xrandr cpupower; do
    if ! pacman -Qs $pkg > /dev/null; then
        echo "Installation $pkg..."
        sleep 1
        sudo pacman -S --noconfirm $pkg || { echo "Installation error $pkg"; exit 1; }
        sleep 1
    else
        echo "$pkg already installed."
    fi
done

mkdir -p ~/.config/bspwm ~/.config/picom ~/.config/kitty ~/wallpapers

mv ~/Downloads/bspwmrc ~/.config/bspwm

mv ~/Downloads/sxhkdrc ~/.config/bspwm

mv ~/Downloads/picom.conf ~/.config/picom

#mv ~/Downloads/kitty.conf ~/.config/kitty

mv ~/Downloads/grass.jpg ~/wallpapers

mv ~/Downloads/.xsession ~/

chmod +x ~/.config/bspwm/bspwmrc

chmod +x ~/.xsession

chmod +x ~/display.sh

chmod +x ~/cursor.sh

chmod +x ~/cpu.sh

chmod +x ~/firefox-bin.sh

chmod +x ~/firefox-custom.sh

read -p "Do you want to set the custom screen parameters? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    ./display.sh
    echo "The parameters have been set."
else
    echo "The installation of parameters has been skipped."
fi

read -p "Do you want to set the custom CPU parameters? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    ./cpu.sh
    echo "The parameters have been set."
else
    echo "The installation of parameters has been skipped."
fi

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
    echo "The installation of yay has been skipped."
fi

read -p "Do you want to install cava? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    yay -S --noconfirm cava
    echo "cava is installed."
else
    echo "The installation of cava has been skipped."
fi

read -p "Do you want to install nvidia-settings? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    sudo pacman -S --noconfirm nvidia-settings
    echo "nvidia-settings is installed."
else
    echo "The installation nvidia-settings has been skipped."
fi

read -p "Do you want to install minecraft-launcher? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    yay -S --noconfirm minecraft-launcher
    echo "minecraft-launcher is installed."
else
    echo "The installation minecraft-launcher has been skipped."
fi

sudo pacman -S --noconfirm ly

systemctl enable ly.service

echo "The system need reboot . . ."

exit 0
