# .bashrc

# Source global definitions
if [ -f /etc/bash_profile ]; then
	. /etc/bash_profile
fi

#gpg-agent --daemon
#ssh-agent gnome-session

# Source local definitions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

#if [ -f "${SSH_ENV}" ]; then
#    . "${SSH_ENV}" > /dev/null
#    #ps ${SSH_AGENT_PID} doesn't work under cywgin
#    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#        start_agent;
#    }
#else
#    start_agent;
#fi
