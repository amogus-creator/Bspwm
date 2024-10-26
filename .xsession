#!/bin/bash

sxhkd -c ~/.config/bspwm/sxhkdrc

setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"

systemctl --user restart pipewire

picom --config ~/.config/picom/picom.conf &

feh --bg-scale ~/wallpapers/x.jpg &
 
exec bspwm
