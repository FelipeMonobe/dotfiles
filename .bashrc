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

# start programs
alias p1="~/Scripts/rdp_agent.sh"
alias p2="sudo ~/Scripts/mongo_start.sh"
alias p3="sudo ~/Scripts/redis_start.sh"

# do setup
alias s1="sudo wifi-menu && m1"
alias s2="sudo wifi-menu && m2"
alias s3="sudo wifi-menu && m3"
alias s4="sudo wifi-menu && m4"

# change monitors
alias m1="~/Scripts/multihead_1.sh"
alias m2="~/Scripts/multihead_2.sh"
alias m3="~/Scripts/multihead_3.sh"
alias m4="~/Scripts/multihead_4.sh"

# start workspaces
alias w1="chromium & atom & franz-bin & studio-3t & spotify & termite -d \"/home/xinube/Projects/api\" & cd \"/home/xinube/Projects/web\""
