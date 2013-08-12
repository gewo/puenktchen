#!/bin/bash
# vim: foldmarker={{{,}}} foldlevel=0 foldmethod=marker

# XRandr {{{
  XRANDR_CONF=$(xrandr -q)
  grep '^VGA-1 connected' $XRANDR_CONF
  VGA=$?
  grep '^DRI-I-1 connected' $XRANDR_CONF
  DVI=$?

  if [ $VGA ] && [ $DVI ] ; then
    xrandr --output DVI-I-1 --mode 1920x1080 --right-of VGA-1
  fi
# }}}

xrdb -merge ~/.Xresources

eval $(ssh-agent -s)

xscreensaver -no-splash &

if hash dropbox 2>/dev/null; then
  dropbox start &
fi

exec awesome
