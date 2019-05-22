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
mkdir -P ~/.config/pgcli
rm -rf ~/.config/pgcli/config
ln -s .pgclirc ~/.config/pgcli/config;
rm -rf ~/.myclirc
ln -s .myclirc ~/.myclirc
mkdir -P ~/.config/i3
rm -rf ~/.config/i3/config
ln -s i3/config ~/.config/i3/config

