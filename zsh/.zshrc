
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

autoload -U zmv

function rate() { for i in {1..5}; do if [[ $i -le $1 ]] then echo -ne "\xe2\x98\x85" ; else echo -ne "\xe2\x98\x86" ; fi ; done }
function sayy() { echo "$@" | espeak -p10 -s150 -v mb/mb-en1 2>/dev/null; }

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting rsync perl ssh-agent gas gitignore gnu-utils systemd virtualenv)

source $ZSH/oh-my-zsh.sh
unsetopt sharehistory

# Customize to your needs...

keychain --confhost -q

zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.aux'

. ~/.aliases
. ~/.profile

PATH=$PATH:/usr/games/bin

PATH=$PATH:/opt/android-sdk-update-manager/tools
PATH=$PATH:/opt/android-sdk-update-manager/platform-tools
PATH=$PATH:/opt/sbin

PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/games/.bin

export PATH;
