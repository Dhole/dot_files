# $OpenBSD: dot.profile,v 1.9 2010/12/13 12:54:31 millert Exp $
#
# sh/ksh initialization

PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/X11R6/bin:/usr/local/sbin:/usr/local/bin
export PATH
: ${HOME='/root'}
export HOME
umask 022

case "$-" in
*i*)    # interactive shell
	if [ -x /usr/bin/tset ]; then
		if [ X"$XTERM_VERSION" = X"" ]; then
			eval `/usr/bin/tset -sQ '-munknown:?vt220' $TERM`
		else
			eval `/usr/bin/tset -IsQ '-munknown:?vt220' $TERM`
		fi
	fi
	;;
esac
#export PKG_PATH=ftp://ftp.fr.openbsd.org/pub/OpenBSD/5.7/packages/`machine -a`/
PKG_PATH=http://mirror.codigo23.net/pub/OpenBSD/`uname -r`/packages/`machine -a`/
PKG_PATH=https://stable.mtier.org/updates/`uname -r`/`arch -s`:${PKG_PATH}
export PKG_PATH 
export LC_CTYPE="en_US.UTF-8"
. /etc/ksh.kshrc

ENV=${HOME}/.kshrc
