#!/bin/sh

dotfiles=~/Sources/dotfiles

# dependencies
sudo pacman -S --needed xorg-xinput kate irqbalance rng-tools openssh
sudo pacman -S --needed workrave

# timezone, locale
sudo timedatectl set-timezone Europe/Amsterdam
sudo localectl set-locale LANG=nl_NL.UTF-8 LC_MESSAGES=en_US.UTF-8

# services
sudo systemctl enable --now rngd
sudo systemctl enable --now irqbalance
sudo systemctl enable --now systemd-timesyncd

# user config files
ln -sf $dotfiles/.Xmodmap ~/.Xmodmap
ln -sf $dotfiles/.Xresources ~/.Xresources
ln -sf $dotfiles/.xsession ~/.xsession
mkdir -p ~/.config/i3 > /dev/null 2>&1
mkdir -p ~/.config/i3blocks > /dev/null 2>&1
mkdir -p ~/.config/systemd/user > /dev/null 2>&1
ln -sf $dotfiles/.config/i3/config ~/.config/i3/config
ln -sf $dotfiles/.config/i3blocks/config ~/.config/i3blocks/config
ln -sf $dotfiles/.zshrc ~/.zshrc
ln -sf $dotfiles/.config/systemd/user/ssh-agent.service ~/.config/systemd/user/ssh-agent.service
systemctl --user enable --now ssh-agent.service

# global config files
sudo ln -sf $dotfiles/profile.d/* /etc/profile.d/
