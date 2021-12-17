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
NeoBundle 'arcticicestudio/nord-vim'
NeoBundle 'franbach/miramare'
NeoBundle 'sainnhe/forest-night'
NeoBundle 'rakr/vim-one'
NeoBundle 'blueshirts/darcula'

NeoBundle 'dense-analysis/ale'
NeoBundle 'roxma/nvim-yarp'
NeoBundle 'ncm2/ncm2'
NeoBundle 'ncm2/ncm2-jedi'
NeoBundle 'ncm2/ncm2-bufword'
NeoBundle 'ncm2/ncm2-path'
NeoBundle 'ncm2/ncm2-pyclang' " not working
NeoBundle 'ncm2/ncm2-racer'
NeoBundle 'ncm2/ncm2-ultisnips'

NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'AndrewRadev/splitjoin.vim'
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
NeoBundle 'sirver/ultisnips'

NeoBundle 'junegunn/goyo.vim'
NeoBundle 'junegunn/limelight.vim'
NeoBundle 'mhinz/vim-startify'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

" latex --------------------------------------------------

autocmd FileType tex set spell
autocmd FileType latex set spell
autocmd FileType plaintex set spell
let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_enabled = 1
let g:vimtex_compiler_progname='nvr'
let g:vimtex_quickfix_latexlog = {'default' : 0, 'references': 1}
let g:vimtex_quickfix_autoclose_after_keystrokes = 20

let g:auto_save = 0
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave"]
augroup ft_tex
  au!
  " autocmd FileType tex let b:auto_save = 1
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
" let g:tex_conceal = "admg"

set conceallevel=1
let g:tex_conceal='abdmg'

let g:vimtex_complete_recursive_bib = 1
" forward search
nnoremap <leader>ls :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf<CR>

let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<s-tab>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" context ------------------------------------------------
" see ftplugin/context.vim

fun! ConTeXtClean()
  let l:currdir = expand("%:p:h")
  let l:tmpdirs = ['.'] " Temporary directories
  let l:suffixes = ['aux', 'bbl', 'blg', 'fls', 'log', 'tuc', 'fdb_latexmk', 'synctex', 'synctex.gz', 'out'] " Suffixes of temporary files
  for ff in glob(l:currdir . '/*.{' . join(l:suffixes, ',') . '}', 1, 1)
    call delete(ff)
  endfor
  for dd in l:tmpdirs
    let l:subdir = l:currdir . '/' . dd
    if isdirectory(l:subdir)
      for ff in glob(l:subdir . '/*.{' . join(l:suffixes, ',') . '}', 1, 1)
        call delete(ff)
      endfor
    endif
    call delete(l:subdir) " Delete directory (only if empty)
  endfor
  echomsg "Aux files removed"
endf

nnoremap <silent> <leader>tc :<c-u>call ConTeXtClean()<cr>

" markdown -----------------------------------------------

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

let g:fzf_layout = { 'down': '~40%' }

" ncm2 ------------------------------------------------------

 autocmd BufEnter * call ncm2#enable_for_buffer()
 set completeopt=menuone,noselect,noinsert

 let ncm2#popup_delay = 5
 let ncm2#complete_length = [[1, 1]]

 " Use <TAB> to select the popup menu:
 inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
 inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Parameter expansion for selected entry via Enter
inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")

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
      \ 'rust': ['rls'],
      \ 'vue': ['eslint', 'vls'],
      \ 'html': ['prettier', 'html-beautify'],
      \ 'css': ['prettier', 'stylelint'],
      \ 'cpp': ['clangd', 'clang-format', 'clang'],
\}

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'python': ['autopep8'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'rust': ['rustfmt'],
      \ 'vue': ['eslint'],
      \ 'css': ['stylelint'],
      \ 'cpp': ['clangtidy', 'clang-format', 'clang'],
      \ 'markdown': ['prettier'],
      \ 'tex': ['latexindent'],
      \ 'bib': ['bibclean']
\}

let g:ale_linter_aliases = {'vue': ['vue', 'javascript', 'css']}
let g:ale_linters_explicit = 1
let g:ale_rust_rls_toolchain = 'stable'

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
      \ 'colorscheme': 'miramare',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'gitbranch', 'filetype' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
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

colo miramare
set background=dark

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

set spelllang=en
inoremap ?? <c-g>u<Esc>[s1z=`]a<c-g>u

nnoremap <silent> j gj
nnoremap <silent> k gk
map B 0
map E $

nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <silent> <leader>, :bp<CR>
nnoremap <silent> <leader>. :bn<CR>
nnoremap <silent> <leader>D :BW<CR>
nnoremap <silent> <leader>d :bw<CR>

set splitbelow splitright

noremap <silent> <left> :vertical resize +3<CR>
noremap <silent> <right> :vertical resize -3<CR>
noremap <silent> <down> :resize +3<CR>
noremap <silent> <up> :resize -3<CR>

nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>

" easy system clipboard copy/paste
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p
noremap <leader>P "+P

" -- Misc -----------------------------------------------

let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 0
let g:startify_files_number = 10
let g:startify_fortune_use_unicode = 1
let g:startify_enable_special = 1
let g:startify_session_sort = 1
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   Recent Files']            },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
let g:startify_bookmarks = [ {'bn': '~/dotfiles/nvimrc'}, {'bd': '~/dotfiles'}, {'bs': '~/.ssh/config'} ]

nnoremap <leader>ss :SSave<CR>
nnoremap <leader>sq :SClose<CR>

nnoremap <leader>sd :set spelllang=de<CR>
nnoremap <leader>se :set spelllang=en<CR>
nnoremap <leader>sn :set nospell<CR>

nnoremap <leader>id :DetectIndent<CR>
nnoremap <leader>gq vipgq

nnoremap <leader>o :! open 

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
