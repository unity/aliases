#!/usr/bin/env zsh

alias g="git"
alias gitpullall="ls -R --directory --color=never */.git | sed 's/\/.git//' | xargs -P10 -I{} git -C {} pull"
alias gt='gittower'
alias lsg='gitstatus'
alias gls='gitstatus'
