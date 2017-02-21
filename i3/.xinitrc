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

XRESOURCES="$HOME/.Xresources"
XRESOURCES_FILE="$XRESOURCES"
XRESOURCES_DIRECTORY="$XRESOURCES.d"

[[ -f "$XRESOURCES_FILE" ]] && xrdb -merge "$XRESOURCES_FILE"
[[ -d "$XRESOURCES_DIRECTORY" ]] && for xr in "$XRESOURCES_DIRECTORY" ; do
  xrdb -merge "$xr"
done

exec dbus-launch --exit-with-session i3

