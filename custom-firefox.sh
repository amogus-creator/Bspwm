#!/bin/bash

sed -i '39s|^..||' "$HOME/.mozilla/firefox/firefox-themes/userChrome.css"

sed -i '/padding-left:/s|3|1|' "$HOME/.mozilla/firefox/firefox-themes/WhiteSur/hide-window-buttons.css"

sed -i '8a padding-right: 1px !important;' "$HOME/.mozilla/firefox/firefox-themes/WhiteSur/hide-window-buttons.css"
