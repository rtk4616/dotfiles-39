#!/bin/sh
mkdir -p ~/.config
rm -rf ~/.config/nvim
ln -s nvim ~/.config/nvim;
rm -rf ~/.zshrc
ln -s .zshrc ~/.zshrc;
rm -rf ~/.tmux.conf
ln -s .tmux.conf ~/.tmux.conf;
rm -rf ~/.tmuxline.conf
ln -s .tmuxline.conf ~/.tmuxline.conf;
rm -rf ~/.config/pgcli/config
ln -s .pgclirc ~/.config/pgcli/config;
rm -rf ~/.myclirc
ln -s .myclirc ~/.myclirc

