
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

autoload -U zmv

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function rate() { for i in {1..5}; do if [[ $i -le $1 ]] then echo -ne "\xe2\x98\x85" ; else echo -ne "\xe2\x98\x86" ; fi ; done }
function sayy() { echo "$@" | espeak -p10 -s150 -v mb/mb-en1 2>/dev/null; }



# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting rsync perl ssh-agent gas gitignore gnu-utils systemd virtualenv)

source $ZSH/oh-my-zsh.sh
unsetopt sharehistory

# Customize to your needs...
export PATH=/opt/bin:/usr/local/bin:/usr/bin:/bin:/opt/android-sdk-update-manager/tools:/opt/android-sdk-update-manager/platform-tools:/usr/games/bin:/opt/sbin:$HOME/bin:$PATH:/$HOME/games/bin:/$HOME/.local/bin:
#ulimit -c 131072

zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.aux'

. ~/.aliases
. ~/.profile

PATH="/home/florek/perl5/bin${PATH+:}$PATH"; export PATH;
PERL5LIB="/home/florek/perl5/lib/perl5${PERL5LIB+:}$PERL5LIB"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/florek/perl5${PERL_LOCAL_LIB_ROOT+:}$PERL_LOCAL_LIB_ROOT"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/florek/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/florek/perl5"; export PERL_MM_OPT;
