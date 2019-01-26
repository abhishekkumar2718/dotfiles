#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export LANG=en_US.UTF-8
export EDITOR='vim'

export WORKON_HOME=~/.env

export PATH="$PATH:~/.local/bin"
export PATH="$PATH:~/bin"
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
