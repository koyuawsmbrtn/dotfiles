# minimalism is everything

# path to my oh-my-zsh installation.
export ZSH="/home/koyu/.oh-my-zsh"

# theme
ZSH_THEME="spaceship"

# plugins
plugins=(
  git
  python
)

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# vim is the default editor
export EDITOR=vim

# aliases
alias cls="clear"
alias cd..="cd .."
alias resource="source ~/.zshrc"
alias neofetch="fastfetch"

# fpath
fpath=($fpath "/home/koyu/.zfunctions")

# set spaceship as prompt
autoload -U promptinit; promptinit

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add user bins to path
export PATH=$PATH:/home/koyu/.local/bin

# brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# redefine _systemctl_unit_state, see https://github.com/ohmyzsh/ohmyzsh/issues/8751#issuecomment-602518773
_systemctl_unit_state() {
  typeset -gA _sys_unit_state
  _sys_unit_state=( $(__systemctl list-unit-files "$PREFIX*" | awk '{print $1, $2}') ) }

# bun completions
[ -s "/home/koyu/.bun/_bun" ] && source "/home/koyu/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# gcalcli
eval "$(register-python-argcomplete gcalcli)"

# nvm
source /usr/share/nvm/init-nvm.sh

# udisksctl
alias dm="udisksctl mount -b"
alias dum="udisksctl unmount -b"
