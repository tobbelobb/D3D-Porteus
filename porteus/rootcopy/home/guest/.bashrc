# Setup shell prompt for guest <wread and fanthom>
PS1='\[\033[01;36m\]\u@\h:\[\033[01;32m\]\w\$\[\033[00m\] '
PS2='> '

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Scad and report work should be done as guest user only
alias scadopen='scadopen.sh'
PATH=$PATH:/home/guest/scripts
