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
zplug "plugins/per-directory-history", from:oh-my-zsh
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

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
  local out q k sha
    while out=$(
      git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
      fzf --ansi --no-sort --query="$q" --print-query \
          --expect=ctrl-d,ctrl-b);
    do
      q=$(head -1 <<< "$out")
      k=$(head -2 <<< "$out" | tail -1)
      sha=$(tail -1 <<< "$out" | cut -d' ' -f1)
      [ -z "$sha" ] && continue
      if [ "$k" = 'ctrl-d' ]; then
        git diff $sha
      elif [ "$k" = 'ctrl-b' ]; then
        git stash branch "stash-$sha" $sha
        break;
      else
        git stash show -p $sha
      fi
    done
}

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf-tmux +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}


zz() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf via local installation
if [ -e ~/.fzf ]; then
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
fi

# fzf + rg configuration
if which fzf  > /dev/null 2>&1 && which thing > /dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi

export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

