#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

clear
screenfetch

# ALIASES

XSH_PATH="~/Projects/bash-scripts"

# overwrite commands
alias mongod="mongod --dbpath=/var/lib/mongodb"
alias redis="systemctl start redis.service && echo ok"

# do setup
alias xsh-setup-1="sudo wifi-menu && $XSH_PATH/multihead.sh 1"
alias xsh-setup-2="sudo wifi-menu && $XSH_PATH/multihead.sh 2"
alias xsh-setup-3="sudo wifi-menu && $XSH_PATH/multihead.sh 3"
alias xsh-setup-4="sudo wifi-menu && $XSH_PATH/multihead.sh 4"
alias xsh-setup-5="sudo wifi-menu && $XSH_PATH/multihead.sh 5"
