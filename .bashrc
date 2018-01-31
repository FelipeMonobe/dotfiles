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
alias mongod="mongod --fork --dbpath /data/db --logpath /data/db/mongodb.log --directoryperdb --wiredTigerDirectoryForIndexes"
alias redis="sudo systemctl start redis.service && echo ok"

# do setup
alias xsh-multihead="$XSH_PATH/multihead.sh"
