#!/bin/sh

touchTerm()
{
        wmctrl -r '_zsh_tmux_plugin_run a' -e '0,0,0,1279,500'
        wmctrl -r '_zsh_tmux_plugin_run a' -b add,shaded
        wmctrl -r '_zsh_tmux_plugin_run a' -b add,below
        touch /tmp/.term.shaded
}
#
# S1=`wmctrl -l|grep 'erminology'|wc -l`

# if [ $S1 -eq '0' ]; then
if ! pgrep -x "terminology" > /dev/null 
then
   terminology
   wmctrl -r '_zsh_tmux_plugin_run a' -e '0,0,0,1279,500'
fi
# Unshade and bring to front
if [ -f /tmp/.term.shaded ]; then
    wmctrl -r '_zsh_tmux_plugin_run a' -b remove,below
    wmctrl -r '_zsh_tmux_plugin_run a' -b remove,shaded
    wmctrl -a '_zsh_tmux_plugin_run a'
    rm /tmp/.term.shaded
# Shade and send to back
else
   touchTerm
fi
