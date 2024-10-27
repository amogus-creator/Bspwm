sudo pacman -S --noconfirm gkt2 gtk3

mkdir -p ~/.local/share/icons

tar xvf Nordzy-cursors-white.tar.gz -C ~/.local/share/icons

tar xvf Nordzy-cursors-white.tar.gz -C /usr/share/icons

mkdir ~/.config/gtk-3.0

touch ~/.config/gtk-3.0/settings.ini

echo '[Settings] gtk-cursor-theme-name=Nordzy-cursors-white' >> ~/.config/gtk-3.0/settings.ini

touch ~/.gtkrc-2.0

echo 'gtk-cursor-theme-name="Nordzy-cursors-white"' >> ~/.gtkrc-2.0

xrdb ~/.Xresources

echo '' >> ~/.config/bspwm/bspwmrc

echo 'xsetroot -cursor_name left_ptr' >> ~/.config/bspwm/bspwmrc
