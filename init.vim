" Skip initialization for vim-tiny or vim-small
if !1 | finish | endif


call plug#begin('~/.vim/plugged')

" Fuzzy Finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Visual Tinkering
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'daveyarwood/vim-alda'

" Colorschemes
Plug 'ntk148v/vim-horizon'
Plug 'flazz/vim-colorschemes'
Plug 'ayu-theme/ayu-vim'
Plug 'nightsense/snow'

" Auto Completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}

" File Browser
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" Languages & Syntax
Plug 'jparise/vim-graphql'

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-sexp'
Plug 'kien/rainbow_parentheses.vim'

" Go
Plug 'fatih/vim-go'

" Protobuf
Plug 'uarun/vim-protobuf'

" Reason
Plug 'reasonml-editor/vim-reason-plus'

" Elm
Plug 'ElmCast/elm-vim'

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
" Plug 'alx741/vim-stylishask'

" Rust
Plug 'rust-lang/rust.vim'

" Utils
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-eunuch'

call plug#end()

" ================ General Config ====================

set number                      " Line numbers are good
set incsearch                   " Incremental search
set hlsearch                    " Highlight search
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set cmdheight=2                 " Better display for messages
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim

" Disables automatic insertion of comments on newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

set ignorecase "Case insensitive search
set smartcase

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

set termguicolors     " enable true colors support
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" colorscheme up
colorscheme horizon
" set background=dark
" colorscheme snow
highlight Pmenu ctermbg=gray guibg=gray

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

let loaded_matchparen = 1 " Disable Highlighting of matching parens

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowritebackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set wildignore+=*/bin/**
set wildignore+=*/gen/**
set wildignore+=*/target/**

" ================ Custom Mappings========================

" Bind leader-leader to tcomment
map <Leader><Leader> gc
nnoremap <F3> gd

nnoremap <Tab> gt
nnoremap <S-Tab> gT

nnoremap <C-h> :winc h<CR>
nnoremap <C-l> :winc l<CR>
nnoremap <C-j> :winc j<CR>
nnoremap <C-k> :winc k<CR>

vnoremap <Leader>y "+y

" opening  a new empty tab
nnoremap <Leader>t :tabe <CR>

" Close current buffer
nnoremap <Leader>w :q <CR>

" Reload current vim config
nnoremap <Leader>r :so $MYVIMRC <CR>

" short

" Keep visual selection after identing
:vnoremap < <gv
:vnoremap > >gv

au FileType rust nmap <Leader>d <Plug>(rust-def)

" ================ Scrolling ================================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Custom Settings =========================

" fzf
set rtp+=/usr/local/opt/fzf
nmap <leader>s :GFiles<CR>

" Reverse SuperTab completion direction
let g:SuperTabDefaultCompletionType = "<c-n>"

" defx
nnoremap <Leader>o :Defx<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
endfunction

" coc
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json', 
  \ 'coc-rls',
  \ 'coc-rust-analyzer',
  \ 'coc-python',
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" vim-jsx
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" Rainbow Parentheses

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_function_parameters = 1
let g:go_highlight_extra_types = 1
