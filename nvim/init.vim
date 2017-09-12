let g:python_host_skip_check=1
" ----------------------------------------- "
" Plugin configs                            "
" ----------------------------------------- "
call plug#begin('~/.config/nvim/plugged')
  "Util
  Plug  'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
  Plug  'https://github.com/junegunn/fzf.vim'
  Plug  'https://github.com/ruchee/vim-polyglot'
  Plug  'https://github.com/scrooloose/nerdtree.git', { 'on': 'NERDTreeToggle' }
  Plug  'https://github.com/tpope/vim-surround.git'
  Plug  'https://github.com/tpope/vim-unimpaired'
  Plug  'https://github.com/jistr/vim-nerdtree-tabs.git'
  Plug  'https://github.com/bling/vim-airline.git'
  Plug  'https://github.com/christoomey/vim-tmux-navigator'
  Plug  'https://github.com/benmills/vimux'
  Plug  'https://github.com/edkolev/tmuxline.vim'
  Plug  'https://github.com/neomake/neomake.git'
  Plug  'https://github.com/terryma/vim-multiple-cursors.git'
  Plug  'https://github.com/tomtom/tcomment_vim.git'
  Plug  'https://github.com/majutsushi/tagbar.git'
  Plug  'https://github.com/Valloric/MatchTagAlways.git'
  Plug  'https://github.com/Raimondi/delimitMate.git'
  Plug  'https://github.com/easymotion/vim-easymotion'
  Plug  'https://github.com/severin-lemaignan/vim-minimap'
  Plug  'https://github.com/sjl/vitality.vim'
  Plug  'https://github.com/thaerkh/vim-workspace'
  " Plug  'https://github.com/vim-utils/vim-alt-mappings'
   Plug  'https://github.com/ryanoasis/vim-devicons'

  "Javascript
  Plug  'https://github.com/moll/vim-node', { 'for': 'javascript' }
  Plug  'https://github.com/marijnh/tern_for_vim' , {'do': 'yarn; yarn global add jsctags tern', 'for': ['javascript', 'javascript.jsx'] }
  Plug  'https://github.com/billyvg/tigris.nvim', { 'do': './install.sh',  'for': ['javascript', 'javascript.jsx'] }
  Plug  'https://github.com/othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx']}
  Plug  'https://github.com/othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx']}
  Plug  'https://github.com/carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
  Plug  'https://github.com/othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug  'https://github.com/neovim/node-host', { 'do': 'yarn', 'for': 'javascript' }

  "Typescript
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Quramy/tsuquyomi', { 'do': 'yarn global add typescript' }
  Plug 'mhartington/deoplete-typescript'

  "Css
  Plug  'https://github.com/ap/vim-css-color.git'

  "Color Theme
  Plug  'https://github.com/jlangston/vim-hybrid'
  Plug  'https://github.com/chriskempson/base16-vim'
  Plug  'https://github.com/altercation/vim-colors-solarized'
  Plug  'https://github.com/vim-airline/vim-airline-themes'

  "Prose
  Plug  'https://github.com/tpope/vim-markdown.git'

  "Programming

  "Plug  'https://github.com/Valloric/YouCompleteMe.git', {'do': 'git submodule update --init --recursive; ./install.py', 'on': []}
  "augroup load_ycm
  " autocmd!
  " autocmd InsertEnter * call plug#load('YouCompleteMe')
  "                   \| call youcompleteme#Enable() | autocmd! load_ycm
  "augroup END
  "
  Plug 'http://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'http://github.com/ervandew/supertab'
  Plug 'https://github.com/mattn/emmet-vim'
  Plug 'https://github.com/SirVer/ultisnips', {'on': []}
  Plug 'https://github.com/honza/vim-snippets'
  " Plug  'https://github.com/arakashic/chromatica.nvim'
  Plug 'https://github.com/sbdchd/neoformat'
  Plug 'https://github.com/mileszs/ack.vim'

  "Git
  Plug  'https://github.com/lambdalisue/gina.vim'
  Plug  'https://github.com/airblade/vim-gitgutter'
  Plug  'https://github.com/Yggdroot/indentLine'
  Plug  'https://github.com/tpope/vim-fugitive'

  "Ansible
  Plug 'https://github.com/MicahElliott/Rocannon'

  "GoLang
  Plug  'https://github.com/fatih/vim-go', { 'for': 'go' }
  Plug  'https://github.com/jodosha/vim-godebug', { 'for': 'go' }
  Plug  'https://github.com/zchee/deoplete-go', { 'do': 'make'}

  "Ruby
  Plug  'https://github.com/tpope/vim-rails', { 'for': 'ruby' }
  Plug  'https://github.com/vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug  'https://github.com/fishbullet/deoplete-ruby', { 'for': 'ruby' }
  Plug  'tpope/vim-rake', { 'for': 'ruby' }
  Plug  'tpope/vim-rbenv', { 'for': 'ruby' }
  Plug  'tpope/vim-bundler', { 'for': 'ruby' }
  Plug  'Keithbsmiley/rspec.vim', { 'for': 'ruby' }


call plug#end()

filetype plugin indent on

colorscheme hybrid
"highlight LineNr ctermfg=darcgrey ctermbg=blacK
highlight LineNr ctermfg=darkgrey ctermbg=none
highlight NonText ctermbg=none
syntax on
if &term == "xterm"
    set term=xterm-256color
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set background=dark
set number
set mouse=a
set mousehide
set modifiable

set autoindent
set clipboard+=unnamed  " use the clipboards of vim and win
set go+=a               " Visual selection automatically copied to the clipboard
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
set encoding=utf8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set inccommand=nosplit
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
" Sudo save
cmap w!! w !sudo tee > /dev/null %

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

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" Buffer cycle
:nnoremap gb :bnext<CR>
:nnoremap gB :bprevious<CR>
:nnoremap <C-q> :bw<CR>

"gita status
nnoremap <leader>gs :Gina status<CR>
nnoremap <leader>gc :Gina commit<CR>

" Fix ctrl h neovim
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

"neomake
autocmd! BufWritePost,BufEnter * Neomake
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

"keys
imap jk <Esc>

"Emmet
let g:user_emmet_expandabbr_key = '<Tab>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

"NerdTree
map <C-k>b :NERDTreeToggle<CR>

nnoremap <leader>s :ToggleWorkspace<CR>

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


" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Comment lines with cmd+/
map <C-/> :TComment<cr>
vmap <C-/> :TComment<cr>gv
map <M-/> :TComment<cr>
vmap <M-/> :TComment<cr>gv

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

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

"Indent Lines
let g:indentLine_enabled = 1

"Vim MultiCursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-d>'
let g:multi_cursor_prev_key = '<C-u>'
let g:multi_cursor_skip_key = '<C-k>' "until we got multiple keys support
let g:multi_cursor_quit_key = '<Esc>'
nnoremap <silent> <C-M-g> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <C-M-g> :MultipleCursorsFind <C-R>/<CR>

let g:used_javascript_libs = 'jquery,react,lodash'

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

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

" AirLine
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#branch#enabled     = 1
let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1
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
nnoremap <leader>nf :NERDTreeFind<CR>

"NeoFormat
nnoremap <leader>fm :Neoformat<CR>

"Chromatica
"let g:chromatica#libclang_path='/usr/local/opt/llvm/lib/'
"let g:chromatica#enable_at_startup=1

"JSX
let g:jsx_ext_required = 0
let g:tigris#enabled = 1

"Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"ViMux
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

"DeoPlete
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ternjs', 'ultisnips', 'buffer']
" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
" or just disable the preview entirely
"set completeopt-=preview

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


"Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

