export EDITOR="$(if [ "$XDG_SESSION_TYPE" != 'tty' ]; then echo 'kate'; else echo 'joe'; fi)"
export RUSTC_WRAPPER=sccache
#makes GNOME on Wayland crash :(
#export GDK_BACKEND="$(if [ "$XDG_SESSION_TYPE" == 'wayland' ]; then echo 'wayland'; else echo 'x11'; fi)"
export ELECTRON_TRASH=trash-cli
alias code='GDK_BACKEND=x11 /usr/bin/code 2>/dev/null'

# https://github.com/aspnet/DotNetTools/issues/399
export DOTNET_ROOT=$(dirname $(realpath $(which dotnet)))
export MSBuildSDKsPath=/opt/dotnet/sdk/$(dotnet --version)/Sdks