#!/bin/bash

unset autologout
export GOPATH=$HOME/go
PATH=/usr/bin:/home/kmulvey/bin/:$PATH:$GOPATH/bin
HISTFILESIZE=99999999
HISTSIZE=99999999
GPG_TTY=$(tty) 
export HISTTIMEFORMAT="%m/%d/%y - %H:%M:%S "
export HADOOP_CONF_DIR=/etc/hadoop/conf/
export GPG_TTY
export TERM=xterm
export VISUAL=vim
export EDITOR="$VISUAL"


# skip if this is a non-interactive shell
if [ -n "$PS1" ]; then

PS1="\u@\h: \W \$(parse_git_branch)> "
PS2="[\w] "

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

fi


alias slide='sudo'
alias gpg='gpg2'
alias print='lpr -P opslp'
alias ls='ls -al'
alias sizels='ls -la | sort -n -k 5 | tail'
alias varsize='df -h | grep var | grep -v run'
alias alpine='alpine -passfile /home/kmulvey/.pinestuff'
alias ed='ed -p:'

#. ~/.xsession

#du -ah $path --exclude='.snapshot' | sort -n -r | head -n $results

if [ -f /usr/share/doc/git/contrib/completion/git-completion.bash ]; then
	. /usr/share/doc/git/contrib/completion/git-completion.bash
fi

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
