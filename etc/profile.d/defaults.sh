export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'kate'; else echo 'joe'; fi)"
export RUSTC_WRAPPER=sccache
export DOTNET_ROOT=$(dirname $(realpath $(which dotnet)))
export MSBuildSDKsPath=/opt/dotnet/sdk/$(dotnet --version)/Sdks
