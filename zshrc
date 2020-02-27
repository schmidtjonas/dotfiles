ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git git-extras brew common-aliases osx pip vi-mode zsh-syntax-highlighting zsh-autosuggestions)

[ -f "$ZSH/oh-my-zsh.sh" ] && source $ZSH/oh-my-zsh.sh
[ -f "$DOTFILES/zsh_design" ] && source $DOTFILES/zsh_design
[ -f "$DOTFILES/aliasrc" ] && source $DOTFILES/aliasrc
[ -f "$DOTFILES/functions" ] && source $DOTFILES/functions

test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

setopt autocd autopushd
autoload -U compinit && compinit
