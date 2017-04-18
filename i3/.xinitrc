#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -I$HOME -merge ~/.Xresources

if which dbus-launch > /dev/null ; then 
	exec dbus-launch --exit-with-session i3 --shmlog-size=26214400
else
	exec i3 --shmlug-size=26214400
fi

