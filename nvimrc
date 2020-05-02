let mapleader=" "
" set rtp+=~/.config/nvim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let &packpath = &runtimepath

set nocompatible
set updatetime=2000

" NeoBundle Scripts-----------------------------------------

if has('vim_starting')
   set runtimepath+=~/.config/nvim/bundle/neobundle.vim
endif

" Required:
call neobundle#begin(expand('~/.config/nvim/bundle'))

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
" NeoBundle 'Chiel92/vim-autoformat'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'tpope/vim-capslock'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-dadbod'
NeoBundle 'ciaranm/detectindent'

NeoBundle 'junegunn/fzf.vim'

NeoBundle 'lervag/vimtex'
NeoBundle '907th/vim-auto-save'

NeoBundle 'qpkorr/vim-bufkill'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

" latex --------------------------------------------------

let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_enabled = 0

let g:auto_save = 0
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave"]
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

" linting with ale ------------------------------------------

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
      \ 'python': ['flake8'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'vue': ['eslint', 'vls'],
      \ 'html': ['prettier', 'html-beautify'],
      \ 'css': ['prettier', 'stylelint'],
\}
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'vue': ['eslint'],
      \ 'css': ['stylelint'],
      \ 'markdown': ['prettier'],
      \ 'python': ['autopep8', 'isort']
\}

let g:ale_linter_aliases = {'vue': ['vue', 'javascript', 'css']}
let g:ale_linters_explicit = 1

nmap <leader>ap <Plug>(ale_previous_wrap)
nmap <leader>an <Plug>(ale_next_wrap)
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>ag :ALEGoToDefinition<CR>
nnoremap <leader>ar :ALEFindReferences<CR>
nnoremap <leader>ah :ALEHover<CR>

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

let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline#extensions#tabline#enabled = 1

let g:airline_theme = 'gruvbox'

let g:airline#extensions#ale#enabled = 1
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_z = '%3l/%L:%3v'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_close_button = 0

" general ---------------------------------------------

colo gruvbox

set nobackup
set noswapfile
set nowritebackup

syntax on
set mouse=a             " use mouse in vim
set number
set expandtab           " tabs are spaces
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set scrolloff=5
set hidden
set backspace
set autoread

set incsearch           " search as characters are entered
set hlsearch            " highlight matches suchen: /wort<ENTER> oder einfach * und # for next occurence
set ignorecase
set smartcase
nnoremap <silent> <ESC> :let @/ = ""<CR><ESC>

set shiftwidth=0
set tabstop=4

set spelllang=de,en
autocmd BufEnter * set nospell

nnoremap <silent> j gj
nnoremap <silent> k gk
map B 0
map E $

nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>, :bp<CR>
nnoremap <leader>. :bn<CR>
nnoremap <silent> <leader>D :BW<CR>
nnoremap <silent> <leader>d :bw<CR>

set splitbelow splitright

noremap <silent> <left> :vertical resize +3<CR>
noremap <silent> <right> :vertical resize -3<CR>
noremap <silent> <up> :resize +3<CR>
noremap <silent> <down> :resize -3<CR>

nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>

" easy system clipboard copy/paste
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p
noremap <leader>P "+P

" -- Misc -----------------------------------------------

nnoremap <leader>id :DetectIndent<CR>

" open term in split
nnoremap <leader>tt :vnew term://zsh<CR>
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

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
