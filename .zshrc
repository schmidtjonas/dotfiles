POWERLEVEL9K_MODE='nerdfont-complete'

# Path to your oh-my-zsh installation.
export ZSH="/Users/Jonas/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git brew common-aliases osx pip zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/dotfiles/.zsh_design
source ~/dotfiles/.aliases

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export PATH="/usr/local/sbin:/Users/jonas/Documents/programs:$PATH"

# react native and Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

setopt  autocd autopushd
autoload -U compinit
compinit

fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions /usr/local/share/zsh/site-functions /usr/local/share/zsh/site-functions /Users/Jonas/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting /Users/Jonas/.oh-my-zsh/plugins/pip /Users/Jonas/.oh-my-zsh/plugins/osx /Users/Jonas/.oh-my-zsh/plugins/common-aliases /Users/Jonas/.oh-my-zsh/plugins/autojump /Users/Jonas/.oh-my-zsh/plugins/brew /Users/Jonas/.oh-my-zsh/plugins/git /Users/Jonas/.oh-my-zsh/functions /Users/Jonas/.oh-my-zsh/completions /usr/local/share/zsh/site-functions /usr/share/zsh/site-functions /usr/share/zsh/5.3/functions)

# z.lua
eval "$(lua /Users/jonas/Documents/programs/z.lua/z.lua --init zsh)"
export _ZL_ECHO=1

# postgresql
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
