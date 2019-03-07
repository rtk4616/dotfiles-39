#!/bin/sh

touchTerm()
{
        wmctrl -r 'Alacritty' -e '0,0,0,1279,500'
        wmctrl -r 'Alacritty' -b add,shaded
        wmctrl -r 'Alacritty' -b add,below
        touch /tmp/.term.shaded
}
#
# S1=`wmctrl -l|grep 'erminology'|wc -l`

# if [ $S1 -eq '0' ]; then
if ! pgrep -x "alacritty" > /dev/null 
then
   alacritty
   wmctrl -r 'Alacritty' -e '0,0,0,1279,500'
fi
# Unshade and bring to front
if [ -f /tmp/.term.shaded ]; then
    wmctrl -r 'Alacritty' -b remove,below
    wmctrl -r 'Alacritty' -b remove,shaded
    wmctrl -a 'Alacritty'
    rm /tmp/.term.shaded
# Shade and send to back
else
   touchTerm
fi
