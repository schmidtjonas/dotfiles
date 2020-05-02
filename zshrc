ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
    common-aliases
    vi-mode
    dotenv
    git
    git-extras
    brew
    osx
    pip
    fzf
)

[ -f "$ZSH/oh-my-zsh.sh" ] && source $ZSH/oh-my-zsh.sh
[ -f "$DOTFILES/zsh_design" ] && source $DOTFILES/zsh_design
[ -f "$DOTFILES/aliasrc" ] && source $DOTFILES/aliasrc
[ -f "$DOTFILES/functions" ] && source $DOTFILES/functions

[ -f "$HOME/.iterm2_shell_integration.zsh" ] && source "$HOME/.iterm2_shell_integration.zsh"

setopt autocd autopushd
autoload -U compinit && compinit
