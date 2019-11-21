#!/bin/zsh
mkdir -p ~/.config
mkdir -p ~/.config/rofi
mkdir -p ~/.config/pgcli
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.tmuxline.conf ~/.tmuxline.conf
ln -sf ~/dotfiles/.pgclirc ~/.config/pgcli/config
ln -sf ~/dotfiles/.myclirc ~/.myclirc
ln -sf ~/dotfiles/i3/config ~/.config/i3/config
ln -sf ~/dotfiles/sway/config ~/.config/sway/config
ln -sf ~/dotfiles/rofi/onedark.rasi ~/.config/rofi/onedark.rasi
ln -sf ~/dotfiles/.asdfrc ~/.asdfrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

