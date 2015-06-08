
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Plugins
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Path configuration
export PATH="/usr/local/bin:/usr/local/share/python:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin"
export PATH=~/Dropbox/.tools:$PATH
export WORKON_HOME=$HOME/.virtualenvs

# Sourcing to other files
source $ZSH/oh-my-zsh.sh
source /usr/local/bin/virtualenvwrapper.sh
source $HOME/.aliases
source $HOME/.functions
source $HOME/.exports

# Setting my default editor to vim
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# Save a ton of history
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=10000

# Enable completion
autoload -U compinit
compinit

# terminal vim
bindkey -v
export KEYTIMEOUT=1
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins '^k' kill-line
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# # Getting the names of the columns in a csv file (comma as separator)
# names () {sed -e 's/,/\
# /g;q'}
#
# function gvim { /Applications/MacVim.app/Contents/MacOS/Vim -g $*; }
