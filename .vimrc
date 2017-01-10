" More Useful
set nocompatible
set backspace=indent,eol,start
set autoindent
set tw=80

set clipboard=unnamed
set wildmenu
set ttyfast
set encoding=utf-8 nobomb

" Respect other developers' modelines
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands
set exrc
set secure

" Enable line numbers
set number

" Coloring
syntax on
hi StatusLine ctermbg=0 ctermfg=8
hi NonText ctermfg=8
hi MatchParen ctermbg=9
hi IncSearch ctermfg=5
hi LineNr ctermfg=1
hi SpecialKey ctermfg=8

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Show invisible characters
set lcs=tab:→\ ,trail:·,eol:¬,nbsp:_
set list

" Search as you type
set incsearch

" Be quiet
set noerrorbells

set nostartofline
set ruler
set title

" Status bar
set laststatus=2
set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %r%=%c,%l/%L\ %p%%

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3
