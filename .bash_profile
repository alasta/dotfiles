# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
       . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

#Variable qui recupere l etat HA - exemple avec utilisation keepalived
#function VRRP_STATE { ip addr show em1 | grep -q "/32"; if [ $? == "0" ]; then echo "Active"; else echo "Standby"; fi; }

#Personnalisation du prompt
if [ `id -u` -eq 0 ]; then
        PS1='[\[$(tput bold)\]\[$(tput setaf 6)\]\A \[$(tput setaf 1)\]\u\[$(tput setaf 3)\]@\[$(tput setaf 7)\]\h ] \[$(tput setaf 2)\]\w \[$(tput setaf 3)\]\$ \[$(tput setaf 7)\]\[$(tput sgr0)\]'
else
        PS1='[\[$(tput bold)\]\[$(tput setaf 6)\]\A \[$(tput setaf 4)\]\u\[$(tput setaf 3)\]@\[$(tput setaf 7)\]\h ] \[$(tput setaf 2)\]\w \[$(tput setaf 3)\]\$ \[$(tput setaf 7)\]\[$(tput sgr0)\]'
fi

#export PATH PS1
alias vi="vim"
alias ll='ls -alh --time-style=+"%Y-%m-%d %H:%M:%S"'



# enable bash completion in interactive shells
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#        . /etc/bash_completion
#fi

#Fonction recuperant les seny SELinux en formattant la date => evite le date -d @1323121321
function sedenied () {
        if [ $# -eq 0 ]
        then
                grep deni /var/log/audit/audit.log | awk -F'[(:]' '{$2=strftime("(%Y/%m/%d-%Hh%Mm%Ss:",$2); print $0}'
        else
                grep deni /var/log/audit/audit.log.$1 | awk -F'[(:]' '{$2=strftime("(%Y/%m/%d-%Hh%Mm%Ss:",$2); print $0}'
        fi
}

#alias lock="vlock -c"
alias tmux="tmux -2"
export PATH=$PATH:~/.local/bin:/usr/local/bin/
export PAGER=most
export EDITOR=vim

# User specific aliases and functions
ssh() {
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
        #tmux rename-window "$(echo $* | cut -d . -f 1)"
        tmux rename-window "$(echo $* | cut -d @ -f 2)"
        settitle "$*"
        command ssh "$@"
       # tmux set-window-option automatic-rename "on" 1>/dev/null
        tmux rename-window "local"
    else
        command ssh "$@"
    fi
}

#export TERM="screen-256color"
