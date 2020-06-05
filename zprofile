#! /bin/zsh

export PATH="$PATH:/usr/local/sbin:$HOME/.scripts:$HOME/Documents/comprog/CPT"

export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/dotfiles"
export ZDOTDIR="$HOME/.config/zsh"
export UPDATE_ZSH_DAYS=7
export KEYTIMEOUT=1 # vi-mode
export LANGUAGE=C

export XDG_CONFIG_HOME="$HOME/.config"
export BASHRC_CONFIG_DIR="$HOME/.config/bash"
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
 else
  export EDITOR='nvim'
fi

# other programs
eval "$(lua $HOME/.scripts/z.lua/z.lua --init zsh)"
export _ZL_ECHO=1

export FZF_DEFAULT_COMMAND="fd --type f --follow --exclude .git --exclude Music --exclude Library --exclude .Trash"
export FZF_BASE=/usr/local/bin/fzf

# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# export PATH=$PATH:~/development/flutter/bin

export GPG_TTY=$(tty)
if [ -f "${HOME}/.gnupg/.gpg-agent-info" ]; then
    . "${HOME}/.gnupg/.gpg-agent-info"
    export GPG_AGENT_INFO
fi
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
zstyle ':bracketed-paste-magic' active-widgets '.self-*'
