#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1="\[\e[31m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\] \[\e[35m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "

# NVM
source /usr/share/nvm/init-nvm.sh

# editor
export EDITOR=vi

# aliases
alias resource="source ~/.bashrc"
alias cls="tput reset"
alias dm="udisksctl mount -b"
alias dum="udisksctl unmount -b"

# fuck
eval "$(thefuck --alias)"

# PATH
export PATH=~/.local/bin:$PATH

# ls options
alias ls="ls --group-directories-first --color"

# vi
alias vi=vim

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# always start at ~ no matter what
cd ~
