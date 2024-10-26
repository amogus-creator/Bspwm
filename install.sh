#!/bin/bash

# Проверка, что скрипт не запускается от имени root
if [ "$(id -u)" = 0 ]; then
    echo "Этот скрипт НЕ должен запускаться от имени пользователя root."
    exit 1
fi

# Логирование
exec > >(tee -i install_log.txt)
exec 2>&1

# Установка необходимых пакетов
echo "Установка необходимых пакетов..."
for pkg in bspwm alacritty sxhkd vim ly ttf-dejavu; do
    if ! pacman -Qs $pkg > /dev/null; then
        echo "Установка $pkg..."
        sudo pacman -S --noconfirm $pkg || { echo "Ошибка установки $pkg"; exit 1; }
    else
        echo "$pkg уже установлен."
    fi
done

# Создание директории конфигурации
echo "Создание директории конфигурации..."
mkdir -p ~/.config/bspwm

# Функция для перемещения файлов
move_file() {
    local src="$1"
    local dest="$2"
    if [ -f "$src" ]; then
        if [ ! -f "$dest" ]; then
            mv "$src" "$dest" || { echo "Ошибка при перемещении $src"; exit 1; }
            echo "Файл $(basename "$src") перемещен."
        else
            echo "Файл $(basename "$src") уже существует в целевой директории, пропускаем..."
        fi
    else
        echo "Файл $(basename "$src")"
