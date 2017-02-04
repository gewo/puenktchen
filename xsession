#!/usr/bin/env zsh
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

for resource in ~/.Xresources.d/* ; do
  [ -r $resource ] && xrdb -merge $resource
done

# eval $(dbus-launch --sh-syntax --exit-with-session)

if [ -r "$HOME/.fehbg" ]; then
  eval $(cat $HOME/.fehbg)
fi

# unclutter &
dunst -config ~/.dotfiles/dunstrc &
urxvtd -q -o -f
setxkbmap -layout 'us(intl-unicode)' -option caps:ctrl_modifier

# Touchpad
# synclient TapButton1=1 &
# synclient TapButton2=3 &
# synclient TapButton3=2 &

workrave &
wicd-gtk --tray &
xfce4-power-manager &
pasystray &

exec i3
