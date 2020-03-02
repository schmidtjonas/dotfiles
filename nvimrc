" lan en_GB.ISO8859-15 " use english from `locale -a`, broken with terminal
let mapleader=" "
" set rtp+=~/.config/nvim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let &packpath = &runtimepath

set nocompatible
set updatetime=2000

" NeoBundle Scripts-----------------------------------------

if has('vim_starting')
    set runtimepath+=/Users/jonas/.config/nvim/bundle/neobundle.vim
endif

" Required:
call neobundle#begin(expand('/Users/jonas/.config/nvim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'rafi/awesome-vim-colorschemes'

NeoBundle 'w0rp/ale'
NeoBundle 'roxma/nvim-yarp'
NeoBundle 'ncm2/ncm2'
NeoBundle 'ncm2/ncm2-jedi'
NeoBundle 'ncm2/ncm2-bufword'
NeoBundle 'ncm2/ncm2-path'
NeoBundle 'ncm2/ncm2-pyclang' " not working

NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'Chiel92/vim-autoformat'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'

NeoBundle 'junegunn/fzf.vim'

NeoBundle 'lervag/vimtex'
NeoBundle '907th/vim-auto-save'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

" latex --------------------------------------------------

let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_enabled = 0

let g:auto_save = 0
let g:auto_save_silent = 1
let g:auto_save_events = ["TextChangedI", "TextChanged", "InsertLeave"]
augroup ft_tex
    au!
    autocmd FileType tex let b:auto_save = 1
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

let g:gitgutter_map_keys = 0
nmap <Leader>ga <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)

" fugitive -------------------------------------------------

nmap <leader>gc :Gcommit<CR>
nmap <leader>gP :Gpush<CR>

" fzf -------------------------------------------------------

set rtp+=/usr/local/opt/fzf
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fe :FZF ~<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>f: :History:<CR>
nnoremap <leader>f/ :History/<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>ft :BTags<CR>

" ncm2 ------------------------------------------------------

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert

let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" suppress the annoying 'match' and 'Pattern not found' messages
set shortmess+=c
let g:ncm2_pyclang#library_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

" lint ------------------------------------------------

let g:ale_lint_on_enter = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
let python_highlight_all=1

nnoremap = :Autoformat<CR>

" nerdtree -----------------------------------------------------

let NERDTreeShowHidden=1

map <silent> <leader>n :NERDTreeToggle<CR>

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

" general ---------------------------------------------

colo gruvbox

set nobackup
set noswapfile
set nowritebackup

syntax on
set mouse=a             " use mouse in vim
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=0
set expandtab           " tabs are spaces
set number              " zeilennummern
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set scrolloff=10

set incsearch           " search as characters are entered
set hlsearch            " highlight matches suchen: /wort<ENTER> oder einfach * und # for next occurence
set ignorecase
set smartcase
set conceallevel=0
nnoremap <silent> <ESC> :let @/ = ""<CR><ESC>

nnoremap <silent> j gj
nnoremap <silent> k gk
map B 0
map E $

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
nnoremap <silent> <leader>d :bw<CR>

nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>

" easy system clipboard copy/paste
noremap <space>y "+y
noremap <space>Y "+Y
noremap <space>p "+p
noremap <space>P "+P

tnoremap <C-n> <C-\><C-n>

nnoremap <leader>v :source ~/dotfiles/nvimrc<CR>:echo 'nvimrc reloaded'<CR>

function! SetGitDir()
    cd %:p:h
    let gitdir=system("git rev-parse --show-toplevel")
    let isnotgitdir=matchstr(gitdir, '^fatal:.*')
    if empty(isnotgitdir)
        cd `=gitdir`
    endif
endfunction
nnoremap <silent> <leader>gcd :call SetGitDir()<CR>
