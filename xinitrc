#!/bin/bash
# vim: foldmarker={{{,}}} foldlevel=0 foldmethod=marker

# XRandr {{{
  XRANDR_CONF=$(xrandr -q)
  grep '^VGA1 connected' $XRANDR_CONF
  VGA=$?
  grep '^HDMI1 connected' $XRANDR_CONF
  HDMI1=$?

  if [ $VGA ] && [ $HDMI1 ] ; then
    xrandr --output HDMI1 --mode 1920x1080 --left-of VGA1
  fi
# }}}

for resource in ~/.Xresources ~/.Xresources.d/* ; do
  [ -r $resource ] && xrdb -merge $resource
done

eval $(dbus-launch --sh-syntax --exit-with-session)
exec awesome
