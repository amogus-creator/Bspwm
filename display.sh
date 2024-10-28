#!/bin/bash

echo "Вывод xrandr:"
xrandr

echo "Доступные мониторы:"
xrandr | grep " connected" | cut -d' ' -f1

read -p "Введите название монитора (например, HDMI-0): " OUTPUT

if xrandr | grep -q "$OUTPUT"; then
    read -p "Введите желаемое разрешение (например, 1920x1080): " SELECTED_RESOLUTION
    read -p "Введите желаемую частоту (по умолчанию 60): " SELECTED_RATE
    SELECTED_RATE=${SELECTED_RATE:-60}

    if xrandr | grep -q "$SELECTED_RESOLUTION" && xrandr | grep -q "${SELECTED_RATE}"; then
        XRANDR_LINE="xrandr --output $OUTPUT --mode $SELECTED_RESOLUTION --rate $SELECTED_RATE"
        sed -i "/^exec bspwm/i $XRANDR_LINE" ~/.xsession
        eval $XRANDR_LINE
    else
        echo "Выбранные значения недоступны."
    fi
else
    echo "Монитор $OUTPUT не найден."
fi
