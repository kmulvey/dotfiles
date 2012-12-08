#!/bin/bash

unset autologout
set term=vt100
HISTFILESIZE=900000
HISTSIZE=900000
export HISTTIMEFORMAT="%m/%d/%y - %H:%M:%S "
PS1="\u@\h: \W > "
PS2="[\w] "
export SVN_EDITOR=vim
export PATH=${PATH}:/Applications/android-sdk/platform-tools

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


alias ls='ls -al'
alias sizels='ls -la | sort -n -k 5 | tail'
alias varmsg='tail -f /var/adm/messages'
alias varsize='df -h | grep var | grep -v run'
alias gmail='alpine'
alias tw='ssh theorywednesday.com'
#alias search='find . -exec grep "pictures1" '{}' \; -print'

##
# Your previous /Users/kmulvey/.bash_profile file was backed up as /Users/kmulvey/.bash_profile.macports-saved_2009-12-13_at_20:38:34
##

# MacPorts Installer addition on 2009-12-13_at_20:38:34: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$HOME/.gem/ruby/1.8/bin/:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/kmulvey/.bash_profile file was backed up as /Users/kmulvey/.bash_profile.macports-saved_2011-09-02_at_13:49:20
##

# MacPorts Installer addition on 2011-09-02_at_13:49:20: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

