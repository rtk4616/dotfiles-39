#!/bin/sh
if [ -f vim ]
then
    echo .vim already exists
else
    ln -s .vim ~/.vim;
fi

if [ -f ~/.vimrc ]
then
    echo ~/.vimrc already exists
else
    ln -s .vimrc ~/.server.vimrc;
fi

if [ -f ~/.zshrc ]
then
    echo ~/.zshrc already exists
else
    ln -s .zshrc ~/.zshrc;
fi

if [ -f ~/.tmux.conf ]
then
    echo ~/.tmux.conf already exists
else
    ln -s .tmux.conf ~/.tmux.conf;
fi

