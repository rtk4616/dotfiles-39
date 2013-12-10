
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

colorscheme Tomorrow-Night-Bright
highlight LineNr ctermfg=darkgrey ctermbg=black
syntax on
set term=xterm-256color
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
set wildignore=*.swp,*.bak
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

if has("gui_macvim")
  set transparency=20
  set guifont=Droid\ Sans\ Mono\ for\ Powerline:h20
  set vb t_vb=
  set guioptions-=m  "no menu
  set guioptions-=T  "no toolbar
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r  "no scrollbar
  set guioptions-=R
  " Select text whit shift
  let macvim_hig_shift_movement = 1
  " autocmd vimenter * NERDTree
endif

"jMKeys
imap jj <Esc>

"NerdTree
map <C-k>b :NERDTreeToggle<CR>

"TagBar
nmap <C-k>o :TagbarToggle<CR>


"Open goto symbol on current buffer
nmap <CS-r> :MyCtrlPTag<cr>
imap <CS-r> <esc>:MyCtrlPTag<cr>

" Open goto symbol on all buffers
nmap <CS-t> :CtrlPBufTagAll<cr>
imap <CS-t> <esc>:CtrlPBufTagAll<cr>

" Open goto file
nmap <C-t> :CtrlP<cr>
imap <C-t> <esc>:CtrlP<cr>

" Comment lines with cmd+/
map <C-/> :TComment<cr>
vmap <C-/> :TComment<cr>gv

" Indent lines with cmd+[ and cmd+]
nmap <C-]> >>
nmap <C-[> <<
vmap <C-[> <gv
vmap <C-]> >gv

" ----------------------------------------- "
" Plugin configs                "
" ----------------------------------------- "

let g:ctrlp_cmd = 'CtrlPMixed'      " search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_working_path_mode = 'ra'  " search for nearest ancestor like .git, .hg, and the directory of the current file
"let g:ctrlp_match_window_bottom = 0   " show the match window at the top of the screen
let g:ctrlp_max_height = 10       " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'    " jump to a file if it's open already
let g:ctrlp_use_caching = 1       " enable caching
let g:ctrlp_clear_cache_on_exit=0     " speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250        " number of recently opened files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }


" coffee: https://gist.github.com/michaelglass/5210282
" go: http://stackoverflow.com/a/8236826/462233 
" objc:  http://www.gregsexton.org/2011/04/objective-c-exuberant-ctags-regex/
" rust: https://github.com/mozilla/rust/blob/master/src/etc/ctags.rust
let g:ctrlp_buftag_types = {
\ 'go'         : '--language-force=go --golang-types=ftv',
\ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
\ 'markdown'   : '--language-force=markdown --markdown-types=hik',
\ 'objc'       : '--language-force=objc --objc-types=mpci',
\ 'rc'         : '--language-force=rust --rust-types=fTm'
\ }


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

"Utilisnips
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
          else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnips-snippets"]

"PowerLine
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'

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

