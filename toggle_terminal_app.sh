#!/bin/sh

touchTerm()
{
        wmctrl -r 'zsh' -e '0,0,0,1279,500'
        wmctrl -r 'zsh' -b add,shaded
        wmctrl -r 'zsh' -b add,below
        touch /tmp/.term.shaded
}
#
# S1=`wmctrl -l|grep 'erminology'|wc -l`

# if [ $S1 -eq '0' ]; then
if ! pgrep -x "kitty" > /dev/null 
then
   kitty
   wmctrl -r 'zsh' -e '0,0,0,1279,500'
fi
# Unshade and bring to front
if [ -f /tmp/.term.shaded ]; then
    wmctrl -r 'zsh' -b remove,below
    wmctrl -r 'zsh' -b remove,shaded
    wmctrl -a 'zsh'
    rm /tmp/.term.shaded
# Shade and send to back
else
   touchTerm
fi
