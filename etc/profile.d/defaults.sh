export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'kate'; else echo 'joe'; fi)"
export RUSTC_WRAPPER=sccache