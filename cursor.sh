#!/bin/bash

# Путь к архиву с курсорами
CURSOR_ARCHIVE=~/Downloads/Nordzy-cursors-white.tar.gz

# Распаковка архива в директорию для курсоров
mkdir -p ~/.icons/Nordzy-cursors-white
tar -xzf "$CURSOR_ARCHIVE" -C ~/.icons/Nordzy-cursors-white

# Настройка GTK и Xresources
mkdir -p ~/.config/gtk-3.0
echo 'gtk-cursor-theme-name="Nordzy-cursors-white"' > ~/.config/gtk-3.0/settings.ini
echo 'XCursor.theme: Nordzy-cursors-white' >> ~/.Xresources

# Применение изменений
xrdb ~/.Xresources
xsetroot -cursor_name left_ptr

# Настройка bspwmrc
echo 'xsetroot -cursor_name left_ptr' >> ~/.config/bspwm/bspwmrc

echo "Курсор установлен и настроен. Пожалуйста, перезапустите сеанс или систему для применения изменений."
