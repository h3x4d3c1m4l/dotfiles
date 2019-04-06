# https://github.com/aspnet/DotNetTools/issues/399
export DOTNET_ROOT=$(dirname $(realpath $(which dotnet)))
export MSBuildSDKsPath=/opt/dotnet/sdk/$(dotnet --version)/Sdks
export ELECTRON_TRASH=trash-cli
export PATH="$PATH:/home/sander/.dotnet/tools:/home/sander/.local/bin"
export MOZ_USE_XINPUT2=1
xinput --set-prop "ETPS/2 Elantech Touchpad" "libinput Natural Scrolling Enabled" 1
xinput --set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Enabled" 1
xinput --set-prop "bcm5974" "libinput Natural Scrolling Enabled" 1
xinput --set-prop "Apple Inc. Magic Trackpad 2" "libinput Natural Scrolling Enabled" 1
setxkbmap -option numpad:microsoft