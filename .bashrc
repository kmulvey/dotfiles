#!/bin/bash

unset autologout
export GOPATH=$HOME/src/go
export GOROOT=/usr/local/go
PATH=/usr/bin:$HOME/bin:$PATH:$GOPATH/bin:$HOME/.local/bin:/usr/local/go/bin:$HOME/bin/node/bin:$HOME/bin/tarsnap
HISTFILESIZE=99999999
HISTSIZE=99999999
GPG_TTY=$(tty) 
export HISTTIMEFORMAT="%m/%d/%y - %H:%M:%S "
export HADOOP_CONF_DIR=/etc/hadoop/conf/
export GPG_TTY
#export TERM=xterm-256color
export TERM=xterm
export VISUAL=vim
export EDITOR="$VISUAL"
export CONFLUENT_HOME=$HOME/confluent-6.1.0

# skip if this is a non-interactive shell
if [ -n "$PS1" ]; then

PS1="\u@\h: \W \$(parse_git_branch)> "
PS2="[\w] "

CPUTIME=$(ps -eo pcpu | awk 'NR>1' | awk '{tot=tot+$1} END {print tot}')
CPUCORES=$(cat /proc/cpuinfo | grep -c processor)
LINK_NAME=$(ip addr | grep "BROADCAST,MULTICAST,UP,LOWER_UP" | awk '{ gsub(":", "", $2); print $2 }')

clear
echo "
================================================================================================

System Summary (collected `date`)

 - CPU Usage (average)       = `echo $CPUTIME / $CPUCORES | bc`%
 - Memory free               = `free -m | awk 'NR==2 { print $7}'` Mb
 - Swap in use               = `free -m | awk 'NR==3 { print $3}'` Mb
 - System Uptime             =`uptime`
 - Public IP                 = `curl --silent icanhazip.com`
 - Private IP                = `ip addr show $LINK_NAME | awk '/inet\s/ { print $2 }'`
 - Disk Space Used           = `df -h / | awk '{ a = $5 } END { print a }'`

================================================================================================
"


#echo ""
#echo ""
#echo "                       ___                         __         __        "
#echo "                      /\_ \                       /\ \       /\ \       "
#echo "   ___  ___    __  __ \//\ \     __  __      __   \ \ \____  \ \ \      "
#echo "  /' _ ''_ \  /\ \ \ \  \ \ \   /\ \ \ \   /'__'\  \ \  __ \  \ \_\     "
#echo " /\ \/\ \/\ \ \ \ \_\ \  \_\ \_ \ \ \ \ \ /\ \_\.\_ \ \ \ \ \  \/_/_    "
#echo " \ \_\ \_\ \_\ \ \____/  /\____\ \ \_\/_/ \ \__/.\_\ \ \_\ \_\   /\_\   "
#echo "  \/_/\/_/\/_/  \/___/   \/____/  \/___/   \/__/\/_/  \/_/ /_/   \/_/   "
#echo ""
echo ""
echo "DON'T PANIC"
echo ""
echo ""

fi


alias slide='sudo'
alias gpg='gpg2'
alias print='lpr -P opslp'
alias ls='ls -al --color'
alias sizels='ls -la | sort -n -k 5 | tail'
alias varsize='df -h | grep var | grep -v run'
alias alpine='alpine -passfile /home/kmulvey/.pinestuff'
alias ed='ed -p:'
alias gt='go test -v -race -count 1 -parallel 5 ./...'
alias gb='go clean -x ./... && go build -v -ldflags="-s -w" ./...'

#. ~/.xsession

#du -ah $path --exclude='.snapshot' | sort -n -r | head -n $results

if [ -f /usr/share/doc/git/contrib/completion/git-completion.bash ]; then
	. /usr/share/doc/git/contrib/completion/git-completion.bash
fi

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
complete -C /usr/local/bin/bit bit
