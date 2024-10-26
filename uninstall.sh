#!/bin/bash

# Проверка, что скрипт не запускается от имени root
if [ "$(id -u)" = 0 ]; then
    echo "Этот скрипт НЕ должен запускаться от имени пользователя root."
    exit 1
fi

# Удаление установленных пакетов
echo "Удаление установленных пакетов..."
for pkg in bspwm alacritty sxhkd vim ly ttf-dejavu; do
    if pacman -Qs $pkg > /dev/null; then
        echo "Удаление $pkg..."
        sudo pacman -Rns --noconfirm $pkg || { echo "Ошибка при удалении $pkg"; exit 1; }
    else
        echo "$pkg не установлен, пропускаем..."
    fi
done

# Удаление конфигурационных файлов
echo "Удаление конфигурационных файлов..."
rm -rf ~/.config/bspwm
rm -f ~/.xsession

echo "Удаление завершено!"
