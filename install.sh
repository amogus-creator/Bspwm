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
done

mkdir -p ~/.config/bspwm ~/.config/picom ~/.config/alacritty ~/wallpapers
sleep 1

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

chmod +x ~/.config/bspwm/bspwmrc

touch ~/.xsession

echo '#!/bin/bash' > ~/.xsession
echo '' >> ~/.xsession
echo 'sxhkd -c ~/.config/bspwm/sxhkdrc' >> ~/.xsession
echo '' >> ~/.xsession
echo 'setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"' >> ~/.xsession
echo '' >> ~/.xsession
echo 'systemctl --user restart pipewire' >> ~/.xsession
echo '' >> ~/.xsession
echo 'picom --config ~/.config/picom/picom.conf &' >> ~/.xsession
echo '' >> ~/.xsession
echo 'feh --bg-scale ~/wallpapers/x.jpg &' >> ~/.xsession
echo '' >> ~/.xsession
echo 'exec bspwm' >> ~/.xsession

chmod +x ~/.xsession

systemctl enable ly.service
