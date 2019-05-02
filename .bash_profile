
# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

export PATH="$HOME/.cargo/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="\[\033[31m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\033[m\]\$ "
alias ls='ls -GFh'
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#find the right .bashrc
 if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
