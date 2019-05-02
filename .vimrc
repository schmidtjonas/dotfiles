set nocompatible              " be iMproved, required
filetype off                  " required <<========== We can turn it on later
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

"Plugin
"'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'

" <============================================>
" Specify the plugins you want to install here.
" We'll come on that later
" <============================================>
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Put the rest of your .vimrc file here

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""" oben Vundle Plugins unten rest
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on               " syntaxhighlighting
colorscheme badwolf " nices colorscheme, liegt in ~/.vim/colors
set tabstop=4	" number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set relativenumber              " show line numbers 
set number
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files vlt braucht man extra indentation files dafuer
set wildmenu            " visual autocomplete for command menu :e ~/.vimr<TAB> geht zB
set lazyredraw          " redraw only when we need to. macht vim scheinbar schneller
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches suchen: /wort<ENTER> oder einfach * und # for next occurence
set ignorecase
set smartcase

nnoremap j gj
nnoremap k gk
inoremap jk <esc>

nnoremap B ^
nnoremap E $

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

let mapleader=" "
set showcmd
nnoremap <SPACE> <nop>

" make tabs better
nnoremap <leader>tN :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>k 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

