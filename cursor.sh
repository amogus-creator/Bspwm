#!/bin/bash

# Путь к архиву с курсорами
CURSOR_ARCHIVE=~/Downloads/Nordzy-cursors-white.tar.gz
CURSOR_DIR=~/.icons/Nordzy-cursors-white

# Проверка, существует ли архив
if [ ! -f "$CURSOR_ARCHIVE" ]; then
    echo "Архив с курсорами не найден: $CURSOR_ARCHIVE"
    exit 1
fi

# Создание директории для курсоров
mkdir -p "$CURSOR_DIR"

# Распаковка архива
tar -xzf "$CURSOR_ARCHIVE" -C ~/.icons/ --strip-components=1

# Настройка GTK
mkdir -p ~/.config/gtk-3.0
echo 'gtk-cursor-theme-name="Nordzy-cursors-white"' > ~/.config/gtk-3.0/settings.ini

# Настройка Xresources
echo 'XCursor.theme: Nordzy-cursors-white' >> ~/.Xresources

# Применение изменений
xrdb ~/.Xresources
xsetroot -cursor_name left_ptr

# Настройка bspwmrc
echo 'xsetroot -cursor_name left_ptr' >> ~/.config/bspwm/bspwmrc

echo "Курсор установлен и настроен. Пожалуйста, перезапустите сеанс или систему для применения изменений."
