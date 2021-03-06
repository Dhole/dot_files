[ "$(which colorls 2>/dev/null)"  ] && alias ls='colorls -G'
alias free='top -n | grep ^Memory'
alias ll='ls -l'
alias la='ls -la'
alias sudo="sudo -E"
alias tmux="tmux -2"

if [ $LOGNAME = 'root' ]; then
	PS1='\e[1;31m\]\u \w $\[\e[0m\] '
else
	PS1='\e[1;32m\]\u \w $\[\e[0m\] '
fi
export PS1


#PS1='\[\e[1;32m\][\u@\h \w]\$\[\e[0m\] '

export GOPATH=~/go
PATH=$PATH:$GOPATH/bin

#ulimit -n 512
#ulimit -p 512
#ulimit -d 2036792

# Colored man pages: http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
# Less Colors for Man Pages
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
