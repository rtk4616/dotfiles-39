#!/bin/zsh
mkdir -p ~/.config
ln -sf ~/dotfiles/.myclirc ~/.myclirc
ln -sf ~/dotfiles/.asdfrc ~/.asdfrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

cd .config
for i in $(find . -mindepth 1 -maxdepth 1 -type d)
do
    d=$(basename "$i")
    rm -rf ~/.config/$d
    ln -sf ~/dotfiles/.config/$d/ ~/.config/$d
done
