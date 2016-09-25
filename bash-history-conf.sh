#!/bin/bash
#-*- shell-script -*-

cat <<EOF
# history setting
HISTSIZE=100000
HISTFILESIZE=1000000
# append (default)
shopt -s histappend
# sync on multiple terminals
# history -a : append immediately
# history -c : clear current session history
# history -r : read history from file
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# date format
export HISTTIMEFORMAT="%y/%m/%d-%T "

PROXY_DOMAIN=""
PROXY_PORT=""
export http_proxy="http://$PROXY_DOMAIN:$PROXY_PORT/"
export https_proxy=$http_proxy
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$https_proxy
export ftp_proxy="ftp://$PROXY_DOMAIN:$PROXY_PORT/"

if [ -f ~/.alias ]; then
  . ~/.alias
fi
function t {
  tmux attach-session $* || tmux $*
}

EOF
