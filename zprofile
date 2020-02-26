export PATH="/usr/local/sbin:$HOME/Documents/programs:$HOME/Documents/comprog/CPT:/Applications/Ipe.app/Contents/MacOS:/usr/local/opt/qt/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/dotfiles"
export ZDOTDIR="$HOME/.config/zsh"
export UPDATE_ZSH_DAYS=7
export KEYTIMEOUT=1 # vi-mode


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
 else
  export EDITOR='nvim'
fi

# other programs
eval "$(lua /Users/jonas/Documents/programs/z.lua/z.lua --init zsh)"
export _ZL_ECHO=1

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
