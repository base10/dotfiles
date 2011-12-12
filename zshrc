# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use BBEdit as an editor
export EDITOR='bbedit -w'

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# keep TONS of history, set other history options
HISTSIZE=4096
SAVEHIST=4096
HISTFILE=$HOME/.zsh/.zhistory

setopt histignoredups
setopt appendhistory
setopt incappendhistory
setopt sharehistory
setopt extendedhistory

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD


setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# Additional exports to match nathan's historical .bash profile
##############################################################################
export CODE=$HOME/code
export SERVICES=$CODE/services
export PATH=$PATH:$HOME/bin

export TERM=xterm-256color
export DB_SOCKET=/usr/local/var/run/mysqld.sock
export SHORTHOST=`hostname -s`

# Add in the right host info
if [ -f $HOME/code/env/bashrc_includes/$SHORTHOST.bash ]; then
    . $HOME/code/env/bashrc_includes/$SHORTHOST.bash
    # echo "sourced in env vars for $SHORTHOST"
fi

if [[ $SHORTHOST == 'orion' ]]; then
    # Make sure the dev environment disk is mounted
    $HOME/bin/mount_dev.sh
fi
