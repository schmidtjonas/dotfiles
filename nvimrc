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

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'mengelbrecht/lightline-bufferline'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'rafi/awesome-vim-colorschemes'

NeoBundle 'dense-analysis/ale'
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
NeoBundle 'arcticicestudio/nord-vim'

NeoBundle 'junegunn/goyo.vim'
NeoBundle 'junegunn/limelight.vim'

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
let g:tex_conceal = "admg"

" markdown

autocmd FileType markdown set textwidth=80

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

command! -bang -nargs=* FLines call fzf#vim#grep('rg --line-number --no-heading '.shellescape(<q-args>), 0, <bang>0)
nnoremap <leader>fi :FLines<CR>

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
      \ 'python': ['flake8', 'autopep8'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'vue': ['eslint', 'vls'],
      \ 'html': ['prettier', 'html-beautify'],
      \ 'css': ['prettier', 'stylelint'],
      \ 'cpp': ['clangd', 'clang-format'],
\}

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'vue': ['eslint'],
      \ 'css': ['stylelint'],
      \ 'python': ['autopep8', 'isort'],
      \ 'cpp': ['clangtidy', 'clang-format'],
      \ 'markdown': ['prettier'],
      \ 'latex': ['latexindent']
\}

let g:ale_linter_aliases = {'vue': ['vue', 'javascript', 'css']}
let g:ale_linters_explicit = 1

nmap [a <Plug>(ale_previous_wrap)
nmap ]a <Plug>(ale_next_wrap)
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>ag :ALEGoToDefinition<CR>
nnoremap <leader>ar :ALEFindReferences<CR>
nnoremap <leader>ah :ALEHover<CR>

" nerdtree -----------------------------------------------------

let NERDTreeShowHidden=1

map <silent> <leader>n :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1

" goyo limelight ----------------------------------------------

autocmd! User GoyoEnter nested set eventignore=FocusGained
autocmd! User GoyoLeave nested set eventignore=
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'

nnoremap <silent> <leader>zz :Goyo<CR>

" lightline -------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

set showtabline=2

" general ---------------------------------------------

colo nord

set nobackup
set noswapfile
set nowritebackup
set noshowmode

syntax on
set mouse=a             " use mouse in vim
set expandtab           " tabs are spaces
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set scrolloff=5
set hidden
" set backspace
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
nnoremap <leader>gq vipgq

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
nnoremap <silent> gcd :call SetGitDir()<CR>

nmap <CR> :a<CR><CR>.<CR>

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
