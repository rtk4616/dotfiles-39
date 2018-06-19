# You can customize where you put it but it’s generally recommended that you put in $HOME/.zplug
# Essential
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

# Load completion library for those sweet [tab] squares
zplug "lib/completion", from:oh-my-zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/mosh", from:oh-my-zsh
# zplug "plugins/per-directory-history", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "templates/zshrc.zsh-template", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"

# Syntax highlighting for commands, load last
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Theme!
zplug "themes/agnoster", from:oh-my-zsh

#export NVM_LAZY_LOAD=true
zplug "lukechilds/zsh-nvm"

# Actually install plugins, prompt user input
# if !zplug check —verbose; then
#     printf "Install zplug plugins? [y/N]:"
#     if read -q; then
#         echo; zplug install
#     fi
# fi

zplug load


# if [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; then
  DEFAULT_USER=$(whoami)
# else
  # DEFAULT_USER="[user name]"
#  DEFAULT_USER=$USER
# fi
#

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

#options
setopt autocd
## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# Example aliases
# alias zshconfig="mate ~/.zshrc"

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
 # export REACT_EDITOR='idea';
 export REACT_EDITOR='subl';
 #source ~/.iterm2_shell_integration.zsh
  # export EDITOR='subl -w';
fi
LINUXBREW='/home/linuxbrew'
if [ -d "$LINUXBREW" ]; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
fi

alias vim='nvim';
alias vi='nvim';
export EDITOR='nvim';

# Customize to your needs...
export TERM=xterm-256color

#Key Bindings
#bindkey -M viins 'jj' vi-cmd-mode;
#bindkey -M viins \C-R history-incremental-search-backward
#bindkey -M vicmd \C-R history-incremental-search-backward
bindkey "^R" history-incremental-search-backward

# if [ -f ~/.comp_zshrc ]; then
 [ -f ~/.comp_zshrc ] && source ~/.comp_zshrc
# fi


# Timestamp format
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fn_history -f' ;;
  "dd.mm.yyyy") alias history='fn_history -E' ;;
  "yyyy-mm-dd") alias history='fn_history -i' ;;
  *) alias history='fn_history' ;;
esac


# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
  source ~/dotfiles/fzf-snippets.zsh
fi

# fzf via local installation
if [ -e ~/.fzf ]; then
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
  source ~/dotfiles/fzf-snippets.zsh
fi

# fzf + rg configuration
if type fzf  &> /dev/null  && type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" '
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  # export FZF_DEFAULT_OPTS='
  # --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  # --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  # '
fi

export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

