export EDITOR="$(if [ "$XDG_SESSION_TYPE" != 'tty' ]; then echo 'kate'; else echo 'joe'; fi)"
export RUSTC_WRAPPER=sccache

### HACKS
export MOZ_ENABLE_WAYLAND=1
export ELECTRON_TRASH=trash-cli
