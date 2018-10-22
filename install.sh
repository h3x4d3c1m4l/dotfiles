#!/bin/sh

dotfiles=~/Sources/dotfiles

ln -sf $dotfiles/.Xmodmap ~/.Xmodmap
ln -sf $dotfiles/.Xresources ~/.Xresources
ln -sf $dotfiles/.xsession ~/.xsession
mkdir -p ~/.config/i3 > /dev/null 2>&1
ln -sf $dotfiles/.config/i3/config ~/.config/i3/config