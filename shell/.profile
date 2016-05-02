POWERLINE_CONFIG_COMMAND=powerline-config

export GOPATH=$HOME/install/go
export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOBIN

export EDITOR=vim

export TZ=Europe/Warsaw

export LD_LIBRARY_PATH=/home/florek/install/rust/lib/ 

export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES="1366x768"

[[ $COLORTERM = gnome-terminal && ! $TERM = screen-256color ]] && TERM=xterm-256color


if [ -e /home/florek/.nix-profile/etc/profile.d/nix.sh ]; then . /home/florek/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
