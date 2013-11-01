# load our own completion functions
fpath=(~/.zsh/completion $fpath)

#for function in ~/.zsh/functions/*; do
#  source $function
#done

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

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




# DO NOT EDIT ABOVE THIS LINE

export SHORTHOST=`hostname -s`

# Add in the right host info
if [ -f $HOME/code/env/zsh_includes/$SHORTHOST.zsh ]; then
    . $HOME/code/env/zsh_includes/$SHORTHOST.zsh
else
    . $HOME/code/env/zsh_includes/global.zsh
fi
