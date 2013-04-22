if [ -f ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi
setxkbmap -option caps:escape
xrdb -merge ~/.Xresources         # update x resources db
xscreensaver -no-splash &         # starts screensaver daemon 
xsetroot -cursor_name left_ptr &  # sets the cursor icon

exec i3
#exec startkde
