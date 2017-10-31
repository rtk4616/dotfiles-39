#!/bin/sh

touchTerm()
{
        wmctrl -r 'terminology' -e '0,0,0,1279,500'
        wmctrl -r 'terminology' -b add,shaded
        wmctrl -r 'terminology>' -b add,below
        touch /tmp/.term.shaded
}
#
# S1=`wmctrl -l|grep 'erminology'|wc -l`

# if [ $S1 -eq '0' ]; then
if ! pgrep -x "terminology" > /dev/null 
then
   terminology
   wmctrl -r 'terminology' -e '0,0,0,1279,500'
fi
# Unshade and bring to front
if [ -f /tmp/.term.shaded ]; then
    wmctrl -r 'terminology' -b remove,below
    wmctrl -r 'terminology' -b remove,shaded
    wmctrl -a 'terminology'
    rm /tmp/.term.shaded
# Shade and send to back
else
   touchTerm
fi
