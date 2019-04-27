# this only works for xorg, see .config/sway/hardware for how to set this for Sway (which runs on Wayland)
xinput --set-prop "ETPS/2 Elantech Touchpad" "libinput Natural Scrolling Enabled" 1
xinput --set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Enabled" 1
xinput --set-prop "bcm5974" "libinput Natural Scrolling Enabled" 1
xinput --set-prop "Apple Inc. Magic Trackpad 2" "libinput Natural Scrolling Enabled" 1
setxkbmap -option numpad:microsoft