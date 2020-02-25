ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git git-extras brew common-aliases osx pip vi-mode zsh-syntax-highlighting zsh-autosuggestions)

[ -f "$ZSH/oh-my-zsh.sh" ] && source $ZSH/oh-my-zsh.sh
[ -f "$DOTFILES/zsh_design" ] && source $HOME/dotfiles/zsh_design
[ -f "$DOTFILES/aliasrc" ] && source $HOME/dotfiles/aliasrc

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

setopt  autocd autopushd
autoload -U compinit
compinit


# vi-mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey '^e' edit-command-line
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

