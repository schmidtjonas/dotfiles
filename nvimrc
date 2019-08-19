let mapleader=" "
nnoremap  <leader>v :source ~/dotfiles/nvimrc<CR>:echo 'vimrc reloaded'<CR>
"
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
set runtimepath +=~/.config/nvim
set rtp+=/usr/local/opt/fzf

set nocompatible
filetype off                  " Required

let &packpath = &runtimepath
" source ~/.vimrc


"NeoBundle Scripts-----------------------------
if has('vim_starting')
    " Required:
    set runtimepath+=/Users/jonas/.config/nvim/bundle/neobundle.vim
endif

" Required:
call neobundle#begin(expand('/Users/jonas/.config/nvim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
" NeoBundle 'kshenoy/vim-signature'
NeoBundle 'ryanoasis/vim-devicons'

NeoBundle 'Yggdroot/indentLine'

" NeoBundle 'w0rp/ale'

NeoBundle 'roxma/nvim-yarp'
NeoBundle 'ncm2/ncm2'

NeoBundle 'ncm2/ncm2-jedi'
NeoBundle 'ncm2/ncm2-bufword'
NeoBundle 'ncm2/ncm2-path'

NeoBundle 'jiangmiao/auto-pairs'

" Formater
NeoBundle 'Chiel92/vim-autoformat'

NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'Xuyuanp/nerdtree-git-plugin'
" NeoBundle 'scrooloose/nerdcommenter'

" NeoBundle '/usr/local/opt/fzf' "brew install fzf

NeoBundle 'rafi/awesome-vim-colorschemes'

" You can specify revision/branch/tag.
" NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
"
"
" start ncm2 customization -----------------
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert

let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" inoremap <expr> <CR> (pumvisible() ? "\<C-n>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

nnoremap = :Autoformat<CR>i<ESC>
" end ncm2 customization -----------------
"
" start nerdtree customization -----------------
"
let NERDTreeShowHidden=1

map <leader>n :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1

" end nerdtree customization -----------------
" start airline customization -----------------
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1

let g:airline_theme = 'badwolf'
" end airline --------------------------------
"
" start indentline ---------------------------
"
" end indentline -----------------------------
"
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

set nobackup
set noswapfile
set nowritebackup

let python_highlight_all=1
syntax on               " syntaxhighlighting

colo deus

set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4
set expandtab           " tabs are spaces
set relativenumber              " zeilennummern
set number
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files vlt braucht man extra indentation files dafuer
set wildmenu            " visual autocomplete for command menu :e ~/.vimr<TAB> geht zB
set lazyredraw          " redraw only when we need to. macht vim scheinbar schneller
set showmatch           " highlight matching [{()}]

" searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches suchen: /wort<ENTER> oder einfach * und # for next occurence
set ignorecase
set smartcase
set scrolloff=10

" remove highlights
nnoremap <silent> <CR> :let @/ = ""<CR>

" navigation
nnoremap j gj
nnoremap k gk
" inoremap jk <esc>

nnoremap B ^
nnoremap E $

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

set showcmd

" make tabs better
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove<CR>
nnoremap <leader>tN :tabnext<CR>
nnoremap <leader>tP :tabprevious<CR>
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


" nnoremap ; :
cmap WQ wq
cmap Wq wq
cmap W w
cmap Q q
cmap q1 q!
cmap qa1 qa!
