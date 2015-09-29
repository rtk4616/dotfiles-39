" ----------------------------------------- "
" Plugin configs                            "
" ----------------------------------------- "
call plug#begin('~/.vim/plugged')
  Plug  'https://github.com/ap/vim-css-color.git'
  Plug  'https://github.com/groenewege/vim-less.git'
  Plug  'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
  Plug  'https://github.com/junegunn/fzf.vim'
  Plug  'https://github.com/pangloss/vim-javascript.git'
  Plug  'https://github.com/othree/yajs.vim'
  Plug  'https://github.com/othree/javascript-libraries-syntax.vim'
  Plug  'https://github.com/jlangston/vim-jsfmt', {'do': 'npm install'}
  Plug  'https://github.com/mxw/vim-jsx'
  Plug  'https://github.com/marijnh/tern_for_vim' , {'do': 'npm install'}
  Plug  'https://github.com/scrooloose/nerdtree.git', { 'on': 'NERDTreeToggle' }
  Plug  'https://github.com/scrooloose/syntastic.git'
  Plug  'https://github.com/tpope/vim-markdown.git'
  Plug  'https://github.com/tpope/vim-surround.git'
  Plug  'https://github.com/mattn/emmet-vim'
  Plug  'https://github.com/jistr/vim-nerdtree-tabs.git'
  Plug  'https://github.com/jlangston/tomorrow-night-vim.git'
  Plug  'https://github.com/w0ng/vim-hybrid'
  Plug  'https://github.com/edkolev/tmuxline.vim.git'
  Plug  'https://github.com/bling/vim-airline.git'
  Plug  'https://github.com/Valloric/YouCompleteMe.git', {'do': './install.py'}
  autocmd! User YouCompleteMe call youcompleteme#Enable()
  Plug  'https://github.com/terryma/vim-multiple-cursors.git'
  Plug  'https://github.com/tomtom/tcomment_vim.git'
  Plug  'https://github.com/majutsushi/tagbar.git'
  Plug  'https://github.com/Valloric/MatchTagAlways.git'
  Plug  'https://github.com/Raimondi/delimitMate.git'
  Plug  'https://github.com/SirVer/ultisnips'
  Plug  'https://github.com/honza/vim-snippets'
  Plug  'https://github.com/tpope/vim-fugitive'
  Plug  'https://github.com/airblade/vim-gitgutter'
  Plug  'https://github.com/easymotion/vim-easymotion'
  Plug  'https://github.com/rizzatti/dash.vim'
call plug#end()

filetype plugin indent on

"colorscheme Tomorrow-Night-Bright
colorscheme hybrid
"highlight LineNr ctermfg=darkgrey ctermbg=black
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
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
" Quickly open/reload vim
nnoremap <leader>ev :split $MYVIMRC<CR>  
nnoremap <leader>sv :source $MYVIMRC<CR>     
"jMKeys
"imap jj <Esc>

"NerdTree
map <C-k>b :NERDTreeToggle<CR>

"TagBar
nmap <C-k>o :TagbarToggle<CR>


"Open goto symbol on current buffer
"nmap <leader>r :CtrlPBufTag
"imap <leader> <esc>:CtrlPTag

" Open goto symbol on all buffers
"nmap <CS-t> :CtrlPBufTagAll<cr>
"imap <CS-t> <esc>:CtrlPBufTagAll<cr>

" Open goto file
nmap <C-p> :FZF<cr>

" Comment lines with cmd+/
map <C-/> :TComment<cr>
vmap <C-/> :TComment<cr>gv

" Indent lines with cmd+[ and cmd+]
nmap <C-]> >>
nmap <C-[> <<
vmap <C-[> <gv
vmap <C-]> >gv

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
let g:airline#extensions#syntastic#enabled  = 1
let g:airline#extensions#tmuxline#enabled  = 1

"Syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0

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

 if &term =~ '256color'
   " Disable Background Color Erase (BCE) so that color schemes
   " work properly when Vim is used inside tmux and GNU screen.
   " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
 endif

if &term =~ '^screen'
  " Page keys http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/FAQ
 execute "set t_kP=\e[5;*~"
 execute "set t_kN=\e[6;*~"

" Arrow keys http://unix.stackexchange.com/a/34723
 execute "set <xUp>=\e[1;*A"
 execute "set <xDown>=\e[1;*B"
 execute "set <xRight>=\e[1;*C"
 execute "set <xLeft>=\e[1;*D"
endif

"ECLIM OmniFunc
let g:EclimCompletionMethod = 'omnifunc'

