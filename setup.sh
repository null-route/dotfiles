#!/bin/bash

echo "Installing common tools"
for x in vim git curl htop zsh; do
	sudo apt-get install $x
done

echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

zsh_theme=my.zsh-theme
zsh_theme_target=~/.oh-my-zsh/themes/
echo "Copying $zsh_theme to $zsh_theme_target"
cp $zsh_theme $zsh_theme_target

zsh_conf=.zshrc
zsh_conf_target=~/
echo "Copying $zsh_conf to $zsh_conf_target"
cp $zsh_conf $zsh_conf_target

echo "Changing shell to zsh"
chsh -s /usr/bin/zsh

vim_conf=.vimrc
vim_conf_target=~/
echo "Copying $vim_conf to $vim_conf_target"
cp $vim_conf $vim_conf_target
