# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#zstyle :compinstall filename '/home/ejradford/.zshrc'

alias c=clear
alias ls='ls --color=auto'
# Left prompt: hostname user%
PROMPT='%m %n%# '

# Right prompt: date and time
RPROMPT='%D{%Y-%m-%d %H:%M:%S}'


autoload -Uz compinit
compinit
# End of lines added by compinstall
