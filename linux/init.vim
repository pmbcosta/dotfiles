" Skip initialization for vim-tiny or vim-small
if !1 | finish | endif


call plug#begin('~/.vim/plugged')

" Fuzzy Finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Visual Tinkering
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'ntk148v/vim-horizon'
Plug 'jiangmiao/auto-pairs'

" Auto Completion
" Using extensions:
"      :CocInstall coc-python
"      :CocInstall coc-rls
"      :CocInstall coc-tsserver
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" File Browser
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" Languages & Syntax
Plug 'rust-lang/rust.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mxw/vim-jsx'

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

set ignorecase "Case insensitive search
set smartcase

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" colorscheme up
colorscheme horizon

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

" Leader-M to next window
nmap <Leader>m <c-w>w<c-d><c-w>W<CR>

nnoremap <Tab> gt
nnoremap <S-Tab> gT

" ================ Scrolling ================================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Custom Settings =========================

" fzf
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
nmap <leader>s :Files<CR>

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
