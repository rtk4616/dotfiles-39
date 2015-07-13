# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER=$(whoami)

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias diff='colordiff'

alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s zip='unzip'
alias -s txt=$EDITOR
alias -s html=$BROWSER

alias got='git '
alias get='git '

if  [[ $('uname') == 'Darwin' ]]; then
 alias st3='~/Dropbox/Apps/st3'
 # alias vim='mvim -v';
 alias vim='nvim';
 # export EDITOR=vim;
 export EDITOR="subl -w";
fi


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode tmux sublime z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export TERM=xterm-256color

#Key Bindings
#bindkey -M viins 'jj' vi-cmd-mode;
#bindkey -M viins \C-R history-incremental-search-backward
#bindkey -M vicmd \C-R history-incremental-search-backward
bindkey "^R" history-incremental-search-backward

# if [ -f ~/.comp_zshrc ]; then
  source ~/.comp_zshrc 
# fi

# Show history
fn_history() {
  # Delete the history file if `-c` argument provided.
  # This won't affect the `history` command output until the next login.
  if [[ "${@[(i)-c]}" -le $# ]]; then
    echo -n >| "$HISTFILE"
  else
    fc $@ -l 1
  fi
}

# Timestamp format
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fn_history -f' ;;
  "dd.mm.yyyy") alias history='fn_history -E' ;;
  "yyyy-mm-dd") alias history='fn_history -i' ;;
  *) alias history='fn_history' ;;
esac


source ~/.iterm2_shell_integration.zsh
