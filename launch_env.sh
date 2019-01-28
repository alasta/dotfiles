#!/bin/bash

##
## Launcher of tmux with ssh-agent management.
## By Alasta
##

##Init binaries
BIN_AWK="/bin/awk"
BIN_FIND="/bin/find"
BIN_GREP="/bin/grep"
BIN_ID="/usr/bin/id"
BIN_SSHADD="/usr/bin/ssh-add"
BIN_SSHAGENT="/usr/bin/ssh-agent"
BIN_SORT="/bin/sort"
BIN_TAIL="/usr/bin/tail"
BIN_TMUX="/usr/bin/tmux -2 "

##Init variables
GET_LAST_SSHAGENT=""
GET_MYEXISTING_TMUXSESSION=""
TMUX_SESSION_NAME="MyTmuxSession"


##Start ssh-agent. Helper program to track user identity key
#eval $(${BIN_SSHAGENT}) # create the process

#Get last ssh-agent file
GET_LAST_SSHAGENT=$(${BIN_FIND} /tmp -uid $(${BIN_ID} -u) -type s -name agent.\* -printf "%T@ %Tc %p\n" 2>/dev/null | ${BIN_SORT} -n | ${BIN_TAIL} -1 | ${BIN_AWK} '{print $NF}')

if [ -z ${GET_LAST_SSHAGENT}  ]
then
  echo "No session found, start new."
  eval $(${BIN_SSHAGENT}) # create the process
  ${BIN_SSHADD}
else
  echo "Launch existing session."
  export SSH_AUTH_SOCK="${GET_LAST_SSHAGENT}"
fi


##Manage existing tmux session

GET_MYEXISTING_TMUXSESSION=$(${BIN_TMUX} ls | ${BIN_GREP} -E "^${TMUX_SESSION_NAME}:" | ${BIN_AWK} -F":" '{print $1}' )

if [ -z ${GET_MYEXISTING_TMUXSESSION} ]
then
  echo "Start new tmux session."
  ${BIN_TMUX} new -s  ${TMUX_SESSION_NAME}
else
  echo "Launch existing tmux session."
  ${BIN_TMUX} attach -t ${TMUX_SESSION_NAME}
fi
