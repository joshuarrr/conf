export PATH=microblog/flask/Scripts:/usr/local/bin:/usr/local/sbin:$PATH

export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

alias sub="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias go='ssh ubuntu'
alias i3="ssh ubuntu -t 'cd i3-release; bash --login'"
alias jr='cd ~/Projects/jr-xiv'

### default prompt
# PS1='[\u@\h \W]\$ '

###  GIT ALIASES ###
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gpme='git push origin HEAD'
alias gd='git diff'
alias gau='git add --update'
alias gc='git commit -v'
alias gca='git commit -a -m'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -D'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'
alias grmb='git rmb' #remove branch

#
alias sub='sublime'

############################################
# Modified from emilis bash prompt script
# from https://github.com/emilis/emilis-config/blob/master/.bash_ps1
#
# Modified for Mac OS X by
# @corndogcomputer
###########################################

# Fill with minuses
# (this is recalculated every time the prompt is shown in function prompt_command):

fill="--- "

reset_style='\e[0;37m'

status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color

prompt_style=$reset_style

command_style=$reset_style'\[$(tput setaf 1)\]'

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

# Prompt variable:

# PS1="$status_style"'$fill \t\n'"$prompt_style"'\w ➤'"$command_style "
PS1="$status_style"'$fill \n'"$prompt_style"'\w ~'"\[\033[0;37m\]\$(parse_git_branch) "'\[\033[0;90m\]➤'"$command_style "


# Reset color for command output

# (this one is invoked every time before a command is executed):

trap 'echo -ne "\033[00m"' DEBUG


function prompt_command {


# create a $fill of all screen width minus the time string and a space:

let fillsize=${COLUMNS}

fill=""

while [ "$fillsize" -gt "0" ]

do

fill="-${fill}" # fill with underscores to work on

let fillsize=${fillsize}-1

done


# If this is an xterm set the title to user@host:dir

case "$TERM" in

xterm*|rxvt*)

bname=`basename "${PWD/$HOME/~}"`

echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"

;;

*)

;;

esac


}

PROMPT_COMMAND=prompt_command

#######################################################################
