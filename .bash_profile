#!/bin/bash

unset autologout
PATH=/usr/bin:$PATH
HISTFILESIZE=99999999
HISTSIZE=99999999
export HISTTIMEFORMAT="%m/%d/%y - %H:%M:%S "
PS1="\u@\h: \W \$(parse_git_branch)> "
PS2="[\w] "
GPG_TTY=$(tty) 
export GPG_TTY

clear


CPUTIME=$(ps -eo pcpu | awk 'NR>1' | awk '{tot=tot+$1} END {print tot}')
CPUCORES=$(cat /proc/cpuinfo | grep -c processor)

echo "
================================================================================================

System Summary (collected `date`)

 - CPU Usage (average)       = `echo $CPUTIME / $CPUCORES | bc`%
 - Memory free (real)        = `free -m | head -n 2 | tail -n 1 | awk {'print $4'}` Mb
 - Memory free (cache)       = `free -m | head -n 3 | tail -n 1 | awk {'print $3'}` Mb
 - Swap in use               = `free -m | tail -n 1 | awk {'print $3'}` Mb
 - System Uptime             =`uptime`
 - Public IP                 = `curl --silent icanhazip.com`
 - Private IP                = `ip addr show eth0 | awk '/inet\s/ { print $2 }'`
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

alias slide='sudo'
alias print='lpr -P opslp'
alias ls='ls -al --color'
alias sizels='ls -la | sort -n -k 5 | tail'
alias varsize='df -h | grep var | grep -v run'
alias alpine='alpine -passfile /home/kmulvey/.pinestuff'

#du -ah $path --exclude='.snapshot' | sort -n -r | head -n $results

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
