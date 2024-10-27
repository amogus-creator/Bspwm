#!/bin/zsh

sudo pacman -S --noconfirm zsh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

chsh -s $(which zsh)

echo "omg theme list"
echo "установлена тема powerlevel10k"


