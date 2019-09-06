filetype plugin indent on    " required

" syntax on               " syntaxhighlighting
set tabstop=4            " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set number              " zeilennummern
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to. macht vim scheinbar schneller
set incsearch           " search as characters are entered
set hlsearch            " highlight matches suchen: /wort<ENTER> oder einfach * und # for next occurence
set ignorecase
set smartcase
set scrolloff=5

nnoremap j gj
nnoremap k gk

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

let mapleader="<SPACE>"
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
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

cmap WQ wq
cmap Wq wq
cmap W w
cmap Q q
