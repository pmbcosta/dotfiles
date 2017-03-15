" Skip initialization for vim-tiny or vim-small
if !1 | finish | endif


" ================ NeoBundle Config =====================

if has('vim_starting')
  set nocompatible

  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes'

call plug#end()

" ================ General Config ====================

set number                      "Line numbers are good
set incsearch                   "Incremental search
set hlsearch                    "Highlight search
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

set ignorecase "Case insensitive search
set smartcase

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Gruvbox Theme Configuration
" colorscheme gruvbox
" set background=dark
" syntax on
"
" if !has("gui_running")
"  let g:gruvbox_italic=0
" endif

" colorscheme gruvbox
" colorscheme xterm16
" colorscheme inkpot
colorscheme up

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

let loaded_matchparen = 1 " Disable Highlighting of matching parens

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
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

" Disable arrow keys

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Bind leader-leader to tcomment
" map <Leader><Leader> gc

" Window navigation 
:nnoremap <Leader>h <C-\><C-n><C-w>h
:noremap <Leader>j <C-\><C-n><C-w>j
:nnoremap <Leader>k <C-\><C-n><C-w>k
:nnoremap <Leader>l <C-\><C-n><C-w>l
:nnoremap <Leader>h <C-w>h
:nnoremap <Leader>j <C-w>j
:nnoremap <Leader>k <C-w>k
:nnoremap <Leader>l <C-w>l

" Leader-s to save files
map <Leader>s :w<CR>


" ================ Scrolling ================================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Custom Settings =========================

syntax enable
