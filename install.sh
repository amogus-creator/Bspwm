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

mkdir -p ~/.config/bspwm ~/.config/picom ~/.config/alacritty ~/wallpapers
sleep 1

mv ~/Downloads/bspwmrc ~/.config/bspwm
sleep 1
mv ~/Downloads/sxhkdrc ~/.config/bspwm
sleep 1
mv ~/Downloads/picom.conf ~/.config/picom
sleep 1
mv ~/Downloads/alacritty.toml ~/.config/alacritty
sleep 1
mv ~/Downloads/x.jpg ~/wallpapers
sleep 1

chmod +x ~/.config/bspwm/bspwmrc

touch ~/.xsession

echo '#!/bin/bash' >> ~/.xsession
echo '' >> ~/.xsession
echo 'sxhkd -c ~/.config/bspwm/sxhkdrc &' >> ~/.xsession
echo '' >> ~/.xsession
echo 'setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"' >> ~/.xsession
echo '' >> ~/.xsession
echo 'systemctl --user restart pipewire' >> ~/.xsession
echo '' >> ~/.xsession
echo 'picom --config ~/.config/picom/picom.conf &' >> ~/.xsession
echo '' >> ~/.xsession
echo 'xrandr --output HDMI-0 --mode 1920x1080 --rate 144' >> ~/.xsession
echo '' >> ~/.xsession
echo 'feh --bg-scale ~/wallpapers/x.jpg &' >> ~/.xsession
echo '' >> ~/.xsession
echo 'eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)' >> ~/.xsession
echo '' >> ~/.xsession
echo 'export SSH_AUTH_SOCK' >> ~/.xsession
echo '' >> ~/.xsession
echo 'exec bspwm' >> ~/.xsession

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

cd ~/Downloads

chmod +x cursor.sh
./cursor.sh

cd

cd ~/Downloads

chmod +x install_firefox-bin.sh
./install_firefox-bin.sh

yay -S --noconfirm minecraft-launcher

sudo pacman -S ly
systemctl enable ly.service

exit 0
