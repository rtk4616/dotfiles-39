set nocompatible
" Pathogen
call pathogen#infect()
call pathogen#helptags()

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on

syntax on
set number
set mouse=a
set mousehide

set autoindent
set nobackup
"set backupdir=~/.vim_backup
set cursorline
set expandtab
set fileformats=unix,dos,mac
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set noerrorbells
set noswapfile
set noshowmode
set noru
set ruler
set showmatch
set noshowmode
set softtabstop=2 tabstop=2 shiftwidth=2
set title
set ttyfast
set undolevels=1000
set visualbell
set wildignore=*.swp,*.bak
set wildmode=longest,list
if has("gui_macvim")
  set transparency=30
  set guifont=Droid\ Sans\ Mono\ for\ Powerline
endif

"Keys
imap jj <Esc>
map <C-k>b :NERDTreeToggle<CR>
nmap <C-k>o :TagbarToggle<CR>
let g:multi_cursor_next_key="\<C-d>"
let g:multi_cursor_prev_key="\<C-b>"
let g:multi_cursor_skip_key="\<C-k><C-d>"
let g:multi_cursor_exit_key="\<Esc>"
map <c-/> <c-_><c-_>

"PowerLine
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'

" Nerdtree
autocmd vimenter * NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
"let NERDTreeMapOpenInTab='<ENTER>'
let g:nerdtree_tabs_open_on_gui_startup=0


set term=xterm-256color
set background=dark
colorscheme tomorrow-night-bright
highlight LineNr ctermfg=darkgrey ctermbg=black

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      " The sleep and & gives time to get back to vim so tmux's focus tracking
      " can kick in and send us our ^[[O
      execute "silent !sh -c 'sleep 0.01; tmux select-pane -" . a:tmuxdir . "' &"
      redraw!
    endif
  endfunction
  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

"ECLIM OmniFunc
let g:EclimCompletionMethod = 'omnifunc'
