#!/bin/bash

sxhkd -c ~/.config/bspwm/sxhkdrc

setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
 
exec bspwm
