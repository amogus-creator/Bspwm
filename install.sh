#!/bin/bash

# Проверка, что скрипт не запускается от имени root
if [ "$(id -u)" = 0 ]; then
    echo "Этот скрипт НЕ должен запускаться от имени пользователя root."
    exit 1
fi

# Установка необходимых пакетов
echo "Установка необходимых пакетов..."
sleep 1
sudo pacman -S --noconfirm bspwm alacritty sxhkd vim ly ttf-dejavu
sleep 2

# Создание директории конфигурации
echo "Создание директории конфигурации..."
sleep 1
mkdir -p ~/.config/bspwm
sleep 1

# Перемещение файлов конфигурации с проверкой на существование
echo "Перемещение файлов конфигурации..."
sleep 1

if [ -f ~/Downloads/bspwmrc ]; then
    if [ ! -f ~/.config/bspwm/bspwmrc ]; then
        mv ~/Downloads/bspwmrc ~/.config/bspwm/
        echo "Файл bspwmrc перемещен."
    else
        echo "Файл bspwmrc уже существует в целевой директории, пропускаем..."
    fi
else
    echo "Файл bspwmrc не найден, пропускаем..."
fi
sleep 1

if [ -f ~/Downloads/sxhkdrc ]; then
    if [ ! -f ~/.config/bspwm/sxhkdrc ]; then
        mv ~/Downloads/sxhkdrc ~/.config/bspwm/
        echo "Файл sxhkdrc перемещен."
    else
        echo "Файл sxhkdrc уже существует в целевой директории, пропускаем..."
    fi
else
    echo "Файл sxhkdrc не найден, пропускаем..."
fi
sleep 1

if [ -f ~/Downloads/.xsession ]; then
    if [ ! -f ~/.xsession ]; then
        mv ~/Downloads/.xsession ~/
        echo "Файл .xsession перемещен."
    else
        echo "Файл .xsession уже существует в целевой директории, пропускаем..."
    fi
else
    echo "Файл .xsession не найден, пропускаем..."
fi
sleep 1

# Установка прав на выполнение
echo "Установка прав на выполнение для .xsession..."
sleep 1
chmod +x ~/.xsession
sleep 1

echo "Установка прав на выполнение для bspwmrc..."
sleep 1
chmod +x ~/.config/bspwm/bspwmrc
sleep 1

echo "Установка завершена!"
