let mapleader=" "
set runtimepath +=~/.config/nvim
set rtp+=/usr/local/opt/fzf
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set nocompatible
set updatetime=2000

let &packpath = &runtimepath

" NeoBundle Scripts-----------------------------------------

if has('vim_starting')
    set runtimepath+=/Users/jonas/.config/nvim/bundle/neobundle.vim
endif

" Required:
call neobundle#begin(expand('/Users/jonas/.config/nvim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'junegunn/goyo.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
" NeoBundle 'kshenoy/vim-signature'
NeoBundle 'ryanoasis/vim-devicons'

" NeoBundle 'Yggdroot/indentLine'

NeoBundle 'w0rp/ale'
NeoBundle 'roxma/nvim-yarp'
NeoBundle 'ncm2/ncm2'

NeoBundle 'ncm2/ncm2-jedi'
NeoBundle 'ncm2/ncm2-bufword'
NeoBundle 'ncm2/ncm2-path'

NeoBundle 'jiangmiao/auto-pairs'

NeoBundle 'Chiel92/vim-autoformat'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

NeoBundle 'rafi/awesome-vim-colorschemes'

NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'

NeoBundle 'junegunn/fzf.vim'

NeoBundle 'lervag/vimtex'
NeoBundle 'honza/vim-snippets'
" NeoBundle 'SirVer/ultisnips' " NeoBundle 'ncm2/ncm2-ultisnips' didnt work with ncm2

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle '907th/vim-auto-save'

" NeoBundle 'vim-scripts/ReplaceWithRegister'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

colo gruvbox

" latex --------------------------------------------------

let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_enabled = 0

let g:auto_save = 0
let g:auto_save_silent = 1
let g:auto_save_events = ["TextChangedI", "TextChanged", "InsertLeave"]
augroup ft_tex
  au!
  au FileType tex let b:auto_save = 1
augroup END

" gitgutter -----------------------------------------------

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1
highlight clear SignColumn
highlight GitGutterAdd    guifg=#009900 guibg=#073642 ctermfg=2 ctermbg=0
highlight GitGutterChange guifg=#bbbb00 guibg=#073642 ctermfg=3 ctermbg=0
highlight GitGutterDelete guifg=#ff2222 guibg=#073642 ctermfg=1 ctermbg=0

nmap <Leader>ghp <Plug>(GitGutterPreviewHunk)  " git next

" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)  " git add (chunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)   " git undo (chunk)

nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)
" fugitive -------------------------------------------------

nmap <leader>gc :Gcommit<CR>
nmap <leader>gP :Gpush<CR>

" fzf -------------------------------------------------------

nnoremap <leader>f :FZF<CR>
nnoremap <leader>F :FZF ~<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>H :History<CR>
nnoremap <leader>: :History:<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>t :BTags<CR>

" ncm2 ------------------------------------------------------

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert

augroup my_cm_setup
    autocmd!
    autocmd BufEnter * call ncm2#enable_for_buffer()
    autocmd Filetype tex call ncm2#register_source({
                \ 'name': 'vimtex',
                \ 'priority': 8,
                \ 'scope': ['tex'],
                \ 'mark': 'tex',
                \ 'word_pattern': '\w+',
                \ 'complete_pattern': g:vimtex#re#ncm2,
                \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
                \ })
augroup END

let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")


" inoremap <silent> <expr> <TAB> ncm2_ultisnips#expand_or("\<TAB>", 'n')

" suppress the annoying 'match' and 'Pattern not found' messages
set shortmess+=c

nnoremap = :Autoformat<CR>a<ESC>

" nerdtree -----------------------------------------------------

let NERDTreeShowHidden=1

map <silent> <leader>n :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1

" airline -----------------------------------------------------

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

let g:airline_theme = 'gruvbox'

" lint ------------------------------------------------

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
let python_highlight_all=1

" general ---------------------------------------------

set nobackup
set noswapfile
set nowritebackup

syntax on
set mouse=a             " use mouse in vim

set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4
set expandtab           " tabs are spaces
set relativenumber      " zeilennummern
set number              " zeilennummern
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu :e ~/.vimr<TAB> 
set lazyredraw          " redraw only when we need to. 
set showmatch           " highlight matching [{()}]
set scrolloff=10

set incsearch           " search as characters are entered
set hlsearch            " highlight matches suchen: /wort<ENTER> oder einfach * und # for next occurence
set ignorecase
set smartcase
set conceallevel=0

nnoremap <silent> <CR> :let @/ = ""<CR> 

nnoremap <silent> j gj
nnoremap <silent> k gk

map B 0
map E $

set showcmd
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

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
nnoremap <leader>, :bp<CR>
nnoremap <leader>. :bn<CR>
nnoremap <silent> <leader>d :bd<CR>

nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>
cmap WQ wq
cmap Wq wq
cmap W w
cmap Q q
cmap q1 q!
cmap qa1 qa!

" easy system clipboard copy/paste
noremap <space>y "+y
noremap <space>Y "+Y
noremap <space>p "+p
noremap <space>P "+P

nnoremap  <leader>v :source ~/dotfiles/nvimrc<CR>:echo 'nvimrc reloaded'<CR>

nnoremap <silent> <leader>gg :Goyo<CR>ggG
