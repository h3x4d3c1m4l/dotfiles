#!/bin/sh

dotfiles=~/Sources/dotfiles

ln -sf $dotfiles/.Xmodmap ~/.Xmodmap
ln -sf $dotfiles/.Xresources ~/.Xresources
ln -sf $dotfiles/.xsession ~/.xsession
ln -sf $dotfiles/.config/i3/config ~/.config/i3/config