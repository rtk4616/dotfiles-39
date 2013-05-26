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
set nocompatible
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
"set transparency=15

"Keys
imap jj <Esc>
map <C-k>b :NERDTreeToggle<CR>
let g:multi_cursor_next_key="\<C-d>"
let g:multi_cursor_prev_key="\<C-b>"
let g:multi_cursor_skip_key="\<C-k><C-d>"
let g:multi_cursor_exit_key="\<Esc>"

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
colorscheme Tomorrow-Night-Bright
highlight LineNr ctermfg=darkgrey ctermbg=black
