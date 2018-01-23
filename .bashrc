

# 環境変数はprofilesへ
# PATH
export PATH=$HOME/.anyenv/bin:/usr/local/sbin:$PATH

# Aliases
alias ls='ls -G'
alias la='ls -Ga'
alias ll='ls -Gl'
alias lla='ls -Gla'

alias vim='nvim'
alias vi='nvim'


# Init anyenv
eval "$(anyenv init -)";
