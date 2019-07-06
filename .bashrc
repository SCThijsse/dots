#!/usr/bin/env bash
#
# ~/.bashrc
#

# shellcheck source=/dev/null

# Prompt fallback
PS1=" \W\[\e[0m\]\[\e[1;37m\] >>\[\e[34m\]> \[\e[0m\] "

# Git completion
. /usr/share/git/completion/git-completion.bash

# nvm support
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Include aliases and functions
[ -f "$XDG_CONFIG_HOME/bash/aliases" ] && \
    . "$XDG_CONFIG_HOME/bash/aliases"
[ -f "$XDG_CONFIG_HOME/bash/functions" ] && \
    . "$XDG_CONFIG_HOME/bash/functions"

# Include shortcuts
[ -f "$XDG_CONFIG_HOME/bash/shortcuts" ] && \
    . "$XDG_CONFIG_HOME/bash/shortcuts"

for al in $(__git_aliases); do
  # shellcheck disable=SC2139,2086
  alias g$al="git $al"
        
  complete_func=_git_$(__git_aliased_command "$al")
  __function_exists "$complete_func" && __git_complete g"$al" "$complete_func"
done

# Display some info
icy

# Bash options
shopt -s autocd
set   -o vi

# Aliases
alias ..='cd ..'
alias c='clear'
alias cd..='cd ..'
alias clear='clear && icy'
alias dr='docker'
alias dc='docker-compose'
alias diff='diff --color=auto'
alias e='$EDITOR'
alias g='git'
alias grep='grep --color=auto'
alias h='htop -u $USER'
alias htop='htop -u $USER'
alias ll='ls --color=auto -l'
alias ls='ls --color=auto'
alias o='orphans'
alias p='sudo pacman'
alias pamcan='pacman'
alias r='ranger'
alias redshift='redshift -l $LAT:$LONG'
alias ref='shortcuts && . ~/.bashrc'
alias rt='rtorrent'
alias sr='sudo ranger'
alias ss='sudo systemctl'
alias sv='sudo nvim'
alias t='$TERM'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias y='yay'
