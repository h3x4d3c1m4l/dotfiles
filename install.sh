#!/bin/sh

dotfiles=~/Sources/dotfiles

# prechecks
if ! [ -x "$(command -v pacaur)" ]; then
  echo 'pacaur not installed!' >&2
  exit 1
fi

# dependencies
pacaur -S --needed nerd-fonts-hack
sudo pacman -S --needed wget base-devel joe fish irqbalance rng-tools openssh thefuck
sudo pacman -S --needed firefox chromium keepassxc gnome-keyring telegram-desktop nextcloud-client
sudo pacman -S --needed sway waybar termite rofi ttf-font-awesome
sudo pacman -S --needed p7zip unrar unarchiver lzop lrzip cpio arj lha lrzip lzip lzop unarj poppler-glib libgsf gvfs-mtp gvfs-gphoto2 gvfs-smb file-roller ark xarchiver gvfs tumbler thunar-volman thunar-archive-plugin thunar

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
#dconf reset -f /apps/guake/
#dconf load /apps/guake/ < $dotfiles/guake.settings
ln -sf $dotfiles/.Xmodmap ~/.Xmodmap
ln -sf $dotfiles/.Xresources ~/.Xresources
ln -sf $dotfiles/.xsession ~/.xsession
mkdir -p ~/.config/sway > /dev/null 2>&1
mkdir -p ~/.config/waybar > /dev/null 2>&1
mkdir -p ~/.config/systemd/user > /dev/null 2>&1
mkdir -p ~/.config/fish/conf.d > /dev/null 2>&1
mkdir -p ~/.config/termite > /dev/null 2>&1
ln -sf $dotfiles/.config/sway/config ~/.config/sway/config
ln -sf $dotfiles/.config/sway/hotkeys ~/.config/sway/hotkeys
ln -sf $dotfiles/.config/sway/hardware ~/.config/sway/hardware
ln -sf $dotfiles/.config/waybar/config ~/.config/waybar/config
ln -sf $dotfiles/.zshrc ~/.zshrc
ln -sf $dotfiles/.config/systemd/user/ssh-agent.service ~/.config/systemd/user/ssh-agent.service
ln -sf $dotfiles/.config/fish/conf.d/custom.fish ~/.config/fish/conf.d/custom.fish
ln -sf $dotfiles/.config/termite/config ~/.config/termite/config
systemctl --user enable --now ssh-agent.service

# global config files
sudo ln -sf $dotfiles/etc/profile.d/* /etc/profile.d/
sudo ln -sf $dotfiles/etc/udev/hwdb.d/10-my-modifiers.hwdb /etc/udev/hwdb.d/10-my-modifiers.hwdb
