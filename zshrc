POWERLEVEL9K_MODE='nerdfont-complete'

export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/dotfiles"
export GPG_TTY=$(tty)

ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git git-extras brew common-aliases osx pip vi-mode zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source ~/dotfiles/zsh_design
source ~/dotfiles/aliases

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
 else
  export EDITOR='nvim'
fi

export PATH="/usr/local/sbin:$HOME/Documents/programs:$HOME/Documents/comprog/CPT:/Applications/Ipe.app/Contents/MacOS:/usr/local/opt/qt/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

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
eval "$(lua /Users/jonas/Documents/programs/z.lua/z.lua --init zsh)"
export _ZL_ECHO=1

# vi-mode
export KEYTIMEOUT=1
bindkey -M vicmd '?' history-incremental-search-backward

if [ -f "${HOME}/.gnupg/.gpg-agent-info" ]; then
    . "${HOME}/.gnupg/.gpg-agent-info"
    export GPG_AGENT_INFO
fi
