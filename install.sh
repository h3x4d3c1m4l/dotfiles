#!/bin/sh

dotfiles=~/Sources/dotfiles

# prechecks
if ! [ -x "$(command -v pacaur)" ]; then
  echo 'pacaur not installed!' >&2
  exit 1
fi

# dependencies
pacaur -S --needed nerd-fonts-complete
sudo pacman -S --needed git wget base-devel joe fish networkmanager irqbalance rng-tools openssh thefuck
sudo pacman -S --needed xorg-xinput guake kate workrave firefox chromium

# timezone, locale, default shell
sudo timedatectl set-timezone Europe/Amsterdam
sudo localectl set-locale LANG=nl_NL.UTF-8 LC_MESSAGES=en_US.UTF-8
#chsh -s /usr/bin/fish

# services
sudo systemctl enable --now rngd
sudo systemctl enable --now irqbalance
sudo systemctl enable --now systemd-timesyncd
sudo systemctl enable --now NetworkManager

# user config files
dconf reset -f /apps/guake/
dconf load /apps/guake/ < $dotfiles/guake.settings
ln -sf $dotfiles/.Xmodmap ~/.Xmodmap
ln -sf $dotfiles/.Xresources ~/.Xresources
ln -sf $dotfiles/.xsession ~/.xsession
mkdir -p ~/.config/i3 > /dev/null 2>&1
mkdir -p ~/.config/i3blocks > /dev/null 2>&1
mkdir -p ~/.config/systemd/user > /dev/null 2>&1
mkdir -p ~/.config/fish/conf.d > /dev/null 2>&1
ln -sf $dotfiles/.config/i3/config ~/.config/i3/config
ln -sf $dotfiles/.config/i3blocks/config ~/.config/i3blocks/config
ln -sf $dotfiles/.zshrc ~/.zshrc
ln -sf $dotfiles/.config/systemd/user/ssh-agent.service ~/.config/systemd/user/ssh-agent.service
ln -sf $dotfiles/.config/fish/conf.d/custom.fish ~/.config/fish/conf.d/custom.fish
systemctl --user enable --now ssh-agent.service

# global config files
sudo ln -sf $dotfiles/etc/profile.d/* /etc/profile.d/
sudo ln -sf $dotfiles/etc/udev/hwdb.d/10-my-modifiers.hwdb /etc/udev/hwdb.d/10-my-modifiers.hwdb