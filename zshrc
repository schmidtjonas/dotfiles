if [[ $HOST == Jonas-MacBook-Pro.local ]]; then
  export MBP="true"
fi

POWERLEVEL9K_MODE='nerdfont-complete'

export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/dotfiles"
export GPG_TTY=$(tty)

 ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git brew common-aliases osx pip vi-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/dotfiles/zsh_design
source ~/dotfiles/aliases

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
 else
  export EDITOR='nvim'
fi

export PATH="/usr/local/sbin:$HOME/Documents/programs:$PATH"

setopt  autocd autopushd
autoload -U compinit
compinit

# react native and Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# flutter
export PATH=$PATH:~/development/flutter/bin

# z.lua
if [[ $MBP == true ]]; then
  eval "$(lua /Users/jonas/Documents/programs/z.lua/z.lua --init zsh)"
  export _ZL_ECHO=1
fi

# postgresql
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
