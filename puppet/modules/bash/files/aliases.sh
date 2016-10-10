#!/bin/bash

###
### ATTENTION! ATTENTION! ATTENTION!
###     This file is managed by Puppet.
###     Any local modifications will be lost in the next puppet run.
### ATTENTION! ATTENTION! ATTENTION!
###

alias ls='ls -hAF --color=auto --time-style=long-iso'
alias ll='ls -l'
alias lr='ls -ltr'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ds='ds -h'
alias df='df -h'

alias grep='egrep --color'

alias fstab='cat /etc/fstab | column -t'
alias  mtab='cat /etc/mtab  | column -t'

### vertical list
alias    path='IFS=: && echo path:    ; for f in $PATH            ; do echo "    $f"; done'
alias  ldpath='IFS=: && echo ldpath:  ; for f in $LD_LIBRARY_PATH ; do echo "    $f"; done'
alias manpath='IFS=: && echo manpath: ; for f in $MANPATH         ; do echo "    $f"; done'

### count of files/dirs
alias kountf='for f in *; do printf "%40s %9d\n" $f `find $f -type f | wc -l`; done'
alias kountd='for f in *; do printf "%40s %9d\n" $f `find $f -type d | wc -l`; done'

### size of files/dirs
alias  sizef='find . -type f | xargs du -h | sort -hr | head'
alias  sized='find . -type d | xargs du -h | sort -hr | uniq | head'

alias  env='env | sort'
alias envg='env | sort | grep -i'
alias setg='set | sort | grep -i'

alias rpmi='rpm -qi'
alias rpmc='rpm -qa | wc -l'
alias rpml='rpm -qa | sort'
alias rpmg='rpm -qa | sort | grep -i'

alias yuml='yum list '
alias yumg='yum list | grep -i'

alias syslog="tail -f /var/log/messages"

# alias psg='ps -ef | grep -v grep | grep '
# alias netl='netstat -lanp | grep '

function psg() {

    if [ -z "$1" ]
    then
        ps -ef | more
    else
        ps -ef | head -1
        ps -ef | grep -v grep | egrep -i --color "$1"
    fi

}

function netl() {

    if [ "$UID" == "0" ]
    then cmd="netstat -lanp" # root
    else cmd="netstat -lan"  # users
    fi

    if [ -z "$1" ]
    then
        $cmd | head -2  | tail -1 && \
        $cmd | grep tcp | more
    else
        $cmd | head -2  | tail -1 && \
        $cmd | grep tcp | egrep -i --color "$1"
    fi

}

function mount() {

    if [ -z "$1" ]
    then /bin/mount | column -t
    else /bin/mount $@
    fi

}

function mkcd  {
    mkdir -p "$1" && cd "$1"
}

function pp {

    if [ -z "$1" ]
    then puppet --version
    else puppet apply -e "include $1" $@
    fi

}

# vim:ft=sh

