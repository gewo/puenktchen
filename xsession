#!/usr/bin/env bash

[ -r ~/.screenlayout/mobile.sh ] && source ~/.screenlayout/mobile.sh

for resource in ~/.Xresources.d/* ; do
  [ -r $resource ] && xrdb -merge $resource
done

[ -r "$HOME/.fehbg" ] && eval $(cat $HOME/.fehbg)
setxkbmap -layout 'us(intl-unicode)' -option caps:ctrl_modifier
xcape -e 'Shift_L=parenleft;Shift_R=parenright;Caps_Lock=Escape'
unclutter &
dunst -config ~/.dotfiles/dunstrc &
urxvtd -q -o -f
workrave &
wicd-gtk --tray &
xfce4-power-manager &
pasystray &
redshift -l 11:52 &
exec i3
