#!/bin/sh

dotfiles=~/Sources/dotfiles

# prechecks
if ! [ -x "$(command -v yay)" ]; then
  echo 'yay not installed!' >&2
  exit 1
fi

# remove legacy stuff
sudo unlink /usr/bin/code-x11

# add current user to nice groups
sudo usermod -aG uucp,wheel,video $USER

# dependencies
yay -S --needed base base-devel sudo joe fish wget apparmor openssh xorg-xauth xorg-xhost pulseaudio \
                sl cowsay thefuck \
                networkmanager inettools net-tools irqbalance rng-tools \
                sddm plasma-workspace lightdm lightdm-gtk-greeter \
                sway rofi mako light ttf-font-awesome network-manager-applet-indicator redshift-wlr-gamma-control-git swaylock swayidle qt5-wayland \
                waybar acpilight libappindicator-gtk2 libappindicator-gtk3 libappindicator-sharp \
                chromium firefox keepassxc alacritty alacritty-terminfo termite termite-terminfo thunderbird telegram-desktop nextcloud-client \
                code rustup dotnet-host dotnet-runtime dotnet-sdk cmake \
                font-bh-ttf ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid ttf-roboto noto-fonts ttf-liberation ttf-ubuntu-font-family nerd-fonts-hack \
                snapd flatpak \
                plymouth-git plymouth-theme-arch-breeze-git \
                p7zip unrar unarchiver lzop lrzip cpio arj lha lrzip lzip lzop unarj lz4 poppler-glib libgsf gvfs-mtp gvfs-gphoto2 gvfs-smb file-roller ark xarchiver gvfs tumbler thunar-volman thunar-archive-plugin thunar
                
# timezone, locale, default shell
sudo timedatectl set-timezone Europe/Amsterdam
sudo localectl set-locale LANG=nl_NL.UTF-8 LC_MESSAGES=en_US.UTF-8
chsh -s /usr/bin/fish

# services
sudo systemctl enable --now rngd
sudo systemctl enable --now irqbalance
sudo systemctl enable --now systemd-timesyncd
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now apparmor.service
sudo systemctl enable --now snapd.apparmor.service
sudo systemctl enable --now snapd.socket

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
mkdir -p ~/.config/alacritty > /dev/null 2>&1
ln -sf $dotfiles/.config/sway/config ~/.config/sway/config
ln -sf $dotfiles/.config/sway/hotkeys ~/.config/sway/hotkeys
ln -sf $dotfiles/.config/sway/hardware ~/.config/sway/hardware
ln -sf $dotfiles/.config/waybar/config ~/.config/waybar/config
ln -sf $dotfiles/.config/waybar/style.css ~/.config/waybar/style.css
ln -sf $dotfiles/.zshrc ~/.zshrc
ln -sf $dotfiles/.config/systemd/user/ssh-agent.service ~/.config/systemd/user/ssh-agent.service
ln -sf $dotfiles/.config/fish/conf.d/custom.fish ~/.config/fish/conf.d/custom.fish
ln -sf $dotfiles/.config/termite/config ~/.config/termite/config
ln -sf $dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
systemctl --user enable --now ssh-agent.service

# global config files
sudo mkdir /etc/sddm.conf.d
sudo ln -sf $dotfiles/etc/profile.d/* /etc/profile.d/
sudo ln -sf $dotfiles/etc/udev/hwdb.d/10-my-modifiers.hwdb /etc/udev/hwdb.d/
sudo ln -sf $dotfiles/etc/sddm.conf.d/settings.conf /etc/sddm.conf.d/