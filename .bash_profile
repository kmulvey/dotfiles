#!/bin/bash

unset autologout
PATH=/usr/local/Cellar:$PATH
HISTFILESIZE=99999999
HISTSIZE=99999999
export HISTTIMEFORMAT="%m/%d/%y - %H:%M:%S "
PS1="\u@\h: \W \$(parse_git_branch)> "
PS2="[\w] "
GPG_TTY=$(tty) 
export GPG_TTY

clear

echo ""
echo ""
echo "                       ___                         __         __        "
echo "                      /\_ \                       /\ \       /\ \       "
echo "   ___  ___    __  __ \//\ \     __  __      __   \ \ \____  \ \ \      "
echo "  /' _ ''_ \  /\ \ \ \  \ \ \   /\ \ \ \   /'__'\  \ \  __ \  \ \_\     "
echo " /\ \/\ \/\ \ \ \ \_\ \  \_\ \_ \ \ \ \ \ /\ \_\.\_ \ \ \ \ \  \/_/_    "
echo " \ \_\ \_\ \_\ \ \____/  /\____\ \ \_\/_/ \ \__/.\_\ \ \_\ \_\   /\_\   "
echo "  \/_/\/_/\/_/  \/___/   \/____/  \/___/   \/__/\/_/  \/_/ /_/   \/_/   "
echo ""
echo ""
echo "DON'T PANIC"
echo ""
echo ""

alias slide='sudo'
alias gpg='gpg2'
alias print='lpr -P opslp'
alias ls='ls -al'
alias gpg='gpg2'
alias sizels='ls -la | sort -n -k 5 | tail'
alias varsize='df -h | grep var | grep -v run'
alias ed='ed -p:'

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	. /usr/local/etc/bash_completion.d/git-completion.bash
fi

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
