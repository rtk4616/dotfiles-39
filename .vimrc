" ----------------------------------------- "
" Plugin configs                            "
" ----------------------------------------- "
call plug#begin('~/.vim/plugged')
  Plug  'https://github.com/ap/vim-css-color.git'
  Plug  'https://github.com/groenewege/vim-less.git'
  Plug  'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
  Plug  'https://github.com/junegunn/fzf.vim'
  Plug  'https://github.com/pangloss/vim-javascript.git', { 'for': 'javascript' }
  Plug  'https://github.com/othree/yajs.vim', { 'for': 'javascript' }
  Plug  'https://github.com/othree/javascript-libraries-syntax.vim'
  Plug  'https://github.com/jlangston/vim-jsfmt', { 'for': 'javascript' }
  Plug  'https://github.com/mxw/vim-jsx', { 'for': 'javascript' }
  Plug  'https://github.com/moll/vim-node', { 'for': 'javascript' }
  Plug  'https://github.com/marijnh/tern_for_vim' , {'do': 'npm install'}
  Plug  'https://github.com/isRuslan/vim-es6'
  Plug  'https://github.com/scrooloose/nerdtree.git', { 'on': 'NERDTreeToggle' }
  Plug  'https://github.com/neomake/neomake.git'
  Plug  'https://github.com/tpope/vim-markdown.git'
  Plug  'https://github.com/tpope/vim-surround.git'
  Plug  'https://github.com/tpope/vim-unimpaired'
  Plug  'https://github.com/mattn/emmet-vim'
  Plug  'https://github.com/jistr/vim-nerdtree-tabs.git'
  Plug  'https://github.com/jlangston/tomorrow-night-vim.git'
  Plug  'https://github.com/w0ng/vim-hybrid'
  Plug  'https://github.com/edkolev/tmuxline.vim'
  Plug  'https://github.com/bling/vim-airline.git'
  Plug  'vim-airline/vim-airline-themes'
  Plug  'https://github.com/christoomey/vim-tmux-navigator'
  Plug  'https://github.com/Valloric/YouCompleteMe.git', {'do': 'git submodule update --init --recursive; ./install.py', 'on': []}
  augroup load_ycm
   autocmd!
   autocmd InsertEnter * call plug#load('YouCompleteMe')
                     \| call youcompleteme#Enable() | autocmd! load_ycm
  augroup END
  Plug  'https://github.com/terryma/vim-multiple-cursors.git'
  Plug  'https://github.com/tomtom/tcomment_vim.git'
  Plug  'https://github.com/majutsushi/tagbar.git'
  Plug  'https://github.com/Valloric/MatchTagAlways.git'
  Plug  'https://github.com/Raimondi/delimitMate.git'
  Plug  'https://github.com/SirVer/ultisnips', {'on': []}
  Plug  'https://github.com/honza/vim-snippets'
  Plug  'https://github.com/tpope/vim-fugitive'
  Plug  'https://github.com/airblade/vim-gitgutter'
  Plug  'https://github.com/easymotion/vim-easymotion'
  Plug  'https://github.com/rizzatti/dash.vim'
  Plug  'https://github.com/Yggdroot/indentLine'
" Plug  'https://github.com/vim-utils/vim-alt-mappings'
  Plug  'https://github.com/severin-lemaignan/vim-minimap'
  Plug  'https://github.com/tpope/vim-rails'
call plug#end()

filetype plugin indent on

"colorscheme Tomorrow-Night-Bright
colorscheme hybrid
"highlight LineNr ctermfg=darcgrey ctermbg=blacK
highlight LineNr ctermfg=darkgrey ctermbg=none
syntax on
if &term == "xterm"
    set term=xterm-256color
endif
set background=dark
set number
set mouse=a
set mousehide
set modifiable

set autoindent
set clipboard=unnamed
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set softtabstop=2 tabstop=2 shiftwidth=2
set history=1000
set ttyfast
set undolevels=1000
set wildmode=longest,list
set wildmenu
set cursorline
set expandtab
set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set noshowmode                  " Show current mode.

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters

set switchbuf=usetab,newtab     " open new buffers always in new tabs
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" Remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
" Quickly open/reload vim
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
"Enter Command Mode with space
nmap <Space> :

"Those are annoying
nmap :Q! :q!
nmap :q1 :q!
nmap :Q1 :q!

"Ctrl S to save
noremap <silent> <C-S>  :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

"Normal Copy/Paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Bubble single lines
nmap <M-up> [e
nmap <M-down> ]e
" Bubble multiple lines
vmap <M-up> [egv
vmap <M-down> ]egv

"Tmux Navigator
"nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nmap <bs> :<c-u>TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" Buffer cycle
:nnoremap gb :bnext<CR>
:nnoremap gB :bprevious<CR>

"neomake
autocmd! BufWritePost,BufEnter * Neomake

"keys
"imap jj <Esc>

"Emmet
let g:user_emmet_expandabbr_key = '<Tab>'

"NerdTree
map <C-k>b :NERDTreeToggle<CR>

"TagBar
nmap <C-k>o :TagbarToggle<CR>

"VimDiff
nnoremap <expr> <silent> cn (&diff ? "]c" : ":cnext\<CR>")
nnoremap <expr> <silent> cn (&diff ? "]c" : ":cnext\<CR>")
vnoremap <expr> <silent> cp (&diff ? "[c" : ":cprev\<CR>")
vnoremap <expr> <silent> cp (&diff ? "[c" : ":cprev\<CR>")

"Open goto symbol on current buffer
"nmap <leader>r :CtrlPBufTag
"imap <leader> <esc>:CtrlPTag

" Open goto symbol on all buffers
"nmap <CS-t> :CtrlPBufTagAll<cr>
"imap <CS-t> <esc>:CtrlPBufTagAll<cr>

" Open goto file
nmap <C-p> :FZF<cr>
nmap <leader>b :Buffers<cr>

" Comment lines with cmd+/
map <C-/> :TComment<cr>
vmap <C-/> :TComment<cr>gv

"Easy Motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap ss <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Default fzf layout
let g:fzf_layout = { 'down': '40%' }

" Advanced customization using autoload functions
autocmd VimEnter * command! Colors call fzf#vim#colors({'left': '15%'})

let g:ycm_autoclose_preview_window_after_completion = 1

"let g:session_autosave = 'yes'
"let g:session_autoload = 'yes'
"let g:session_default_to_last = 1

"create line break when pressing enter
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

"Indent Lines
let g:indentLine_enabled = 1

"Vim MultiCursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-d>'
let g:multi_cursor_prev_key = '<C-u>'
let g:multi_cursor_skip_key = '<C-k>' "until we got multiple keys support
let g:multi_cursor_quit_key = '<Esc>'

"JsFmt
let g:js_fmt_command = "jsfmt"
let g:used_javascript_libs = 'jquery,angularjs,angularui,react,underscore'

"Utilisnips
function! g:UltiSnips_Complete()
call UltiSnips#ExpandSnippetOrJump()
if g:ulti_expand_or_jump_res == 0
if pumvisible()
  return "\<C-N>"
else
  return "\<TAB>"
endif
endif

return ""
endif
endfunction

function! g:UltiSnips_Reverse()
call UltiSnips#JumpBackwards()
if g:ulti_jump_backwards_res == 0
return "\<C-P>"
endif

return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" AirLine
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme             = 'powerlineish'
let g:airline#extensions#branch#enabled     = 1
let g:airline#extensions#tmuxline#enabled  = 1

" Tmuxline config
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}


" Nerdtree
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
" let NERDTreeMapOpenInTab='<ENTER>'
let g:nerdtree_tabs_open_on_gui_startup=0


"ECLIM OmniFunc
let g:EclimCompletionMethod = 'omnifunc'

