#!/bin/bash -e
#
# Updates Vim plugins.
#
# Update everything (long):
#
#   ./installVimPlugins
#
# Update just the things from Git:
#
#   ./installVimPlugins repos
#
# Update just one plugin from the list of Git repos:
#
#   ./installVimPlugins repos powerline
#

vimdir=~/.vim
bundledir=$vimdir/bundle
tmp=/tmp/$LOGNAME-vim-update
me=~/.vim/installVimPlugins.sh

# URLS --------------------------------------------------------------------

# This is a list of all plugins which are available via Git repos. git:// URLs
# don't work.
repos=(
  https://github.com/ap/vim-css-color.git
  https://github.com/kien/ctrlp.vim.git
  https://github.com/pangloss/vim-javascript.git
  https://github.com/scrooloose/nerdtree.git
  https://github.com/scrooloose/syntastic.git
  https://github.com/tpope/vim-markdown.git
  https://github.com/tpope/vim-pathogen.git
  https://github.com/tpope/vim-surround.git
  https://github.com/mattn/emmet-vim
  https://github.com/jistr/vim-nerdtree-tabs.git
  https://github.com/jlangston/tomorrow-night-vim.git
  https://github.com/edkolev/tmuxline.vim.git
  https://github.com/bling/vim-airline.git
  https://github.com/Valloric/YouCompleteMe.git
  https://github.com/terryma/vim-multiple-cursors.git
  https://github.com/tomtom/tcomment_vim.git
  https://github.com/majutsushi/tagbar.git
  https://github.com/groenewege/vim-less.git
  https://github.com/Valloric/MatchTagAlways.git
  https://github.com/Raimondi/delimitMate.git
  https://github.com/SirVer/ultisnips
  https://github.com/tpope/vim-fugitive
  https://github.com/airblade/vim-gitgutter
  )

# Here's a list of everything else to download in the format
# <destination>;<url>[;<filename>]
other=()

case "$1" in

  # GIT -----------------------------------------------------------------
  repos)
    mkdir -p $bundledir
    for url in ${repos[@]}; do
      if [ -n "$2" ]; then
        if ! (echo "$url" | grep "$2" &>/dev/null) ; then
          continue
        fi
      fi
      dest="$bundledir/$(basename $url | sed -e 's/\.git$//')"
      rm -rf $dest
      echo "Cloning $url into $dest"
      git clone $url $dest
    done
    ;;

  all)
    $me repos
    $me other
    echo
    echo "Update OK"
    ;;

  *)
    set +x
    echo
    echo "Usage: $0 <section> [<filter>]"
    echo "...where section is one of:"
    grep -E '\w\)$' $me | sed -e 's/)//'
    echo
    echo "<filter> can be used with the 'repos' section."
    exit 1

esac
