# $FreeBSD: release/9.0.0/share/skel/dot.cshrc 170119 2007-05-29 22:07:57Z dougb $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h		history 25
alias j		jobs -l
alias la	ls -a
alias lf	ls -FA
alias ll	ls -lA

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

setenv	EDITOR	vim
setenv	PAGER	less
setenv	BLOCKSIZE	K
setenv 	MAIL	/var/mail/root

if ($?prompt) then
	# An interactive shell -- set some stuff up
    set prompt="%{\e[32;1m%}%n%{\e[37m%}@%{\e[33m%}%m%{\e[37m%}:%{\e[36m%}%~%{\e[37m%}"\$"%{\e[0m%} "
    bindkey "^R" i-search-back
	set filec
    set autolist
	set history = 100
	set savehist = 100
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
endif

