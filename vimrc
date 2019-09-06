filetype plugin indent on    " required

" syntax on               " syntaxhighlighting
set tabstop=4            " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4
set expandtab           " tabs are spaces
set number              " zeilennummern
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to. macht vim scheinbar schneller
set incsearch           " search as characters are entered
set hlsearch            " highlight matches suchen: /wort<ENTER> oder einfach * und # for next occurence
set ignorecase
set smartcase
set scrolloff=10

" remove highlights
nnoremap <silent> <CR> :let @/ = ""<CR>

nnoremap j gj
nnoremap k gk

map B 0
map E $

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

let mapleader=" "
set showcmd
nnoremap <SPACE> <nop>

set nobackup
set noswapfile
set nowritebackup

" make tabs better
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove<CR>
nnoremap <leader>tN :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" make buffers better
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>, :bn<CR>
nnoremap <leader>. :bn<CR>
nnoremap <silent> <leader>d :bd<CR>

nnoremap <leader>q :wqa<CR>
nnoremap <leader>w :w<CR>
cmap WQ wq
cmap Wq wq
cmap W w
cmap Q q
cmap q1 q!
cmap qa1 qa!
