let mapleader=" "
" let maplocalleader=\\

" set rtp+=~/.config/nvim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let &packpath = &runtimepath

set nocompatible
set updatetime=2000

" NeoBundle Scripts-------------------------------

if has('vim_starting')
    set runtimepath+=~/.config/nvim/bundle/neobundle.vim
endif

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
" NeoBundle 'nvim-treesitter/nvim-treesitter'
NeoBundle 'lukas-reineke/indent-blankline.nvim'

" NeoBundle 'neovim/nvim-lspconfig'
" NeoBundle 'Julian/lean.nvim'
" NeoBundle 'ms-jpq/coq_nvim', {'branch': 'coq'}
" NeoBundle 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" NeoBundle 'nvim-lua/plenary.nvim'

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
NeoBundle 'Chiel92/vim-autoformat'

NeoBundle 'kyazdani42/nvim-tree.lua'
NeoBundle 'kyazdani42/nvim-web-devicons'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-dadbod'
NeoBundle 'ciaranm/detectindent'
" NeoBundle 'ludovicchabant/vim-gutentags'

NeoBundle 'junegunn/fzf.vim'

NeoBundle 'lervag/vimtex'
" NeoBundle '907th/vim-auto-save'
NeoBundle 'sirver/ultisnips'

NeoBundle 'kaarmu/typst.vim'

NeoBundle 'junegunn/goyo.vim'
NeoBundle 'junegunn/limelight.vim'
" NeoBundle 'mhinz/vim-startify'
NeoBundle 'glepnir/dashboard-nvim'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

" latex ------------------------------------------

autocmd FileType tex set spell
autocmd FileType latex set spell
autocmd FileType plaintex set spell
let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_enabled = 1
let g:vimtex_compiler_progname='nvr'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_autoclose_after_keystrokes = 20

" let g:auto_save = 0
" let g:auto_save_silent = 1
" let g:auto_save_events = ["InsertLeave"]
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

set conceallevel=1
let g:tex_conceal='abdmg'

let g:vimtex_complete_recursive_bib = 1

nnoremap \ls :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf<CR>

let g:UltiSnipsExpandTrigger = '<c-e>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
imap <c-k> <Nop>
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" gitgutter --------------------------------------

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

" fugitive ---------------------------------------

nmap <leader>gc :Git commit<CR>
nmap <leader>gP :Git push<CR>

" fzf --------------------------------------------

set rtp+=/usr/local/opt/fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fe :Files ~<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>f: :History:<CR>
nnoremap <leader>f/ :History/<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>ft :BTags<CR>

command! -bang -nargs=* FLines call fzf#vim#grep('rg --line-number --no-heading '.shellescape(<q-args>), 0, <bang>0)
nnoremap <leader>fi :FLines<CR>

let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" ncm2 -------------------------------------------

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

" linting with ale -------------------------------

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
    \ 'cpp': ['clang-format', 'clang'],
\ }

let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'python': ['autopep8'],
    \ 'javascript': ['prettier', 'eslint'],
    \ 'rust': ['rustfmt'],
    \ 'vue': ['eslint'],
    \ 'css': ['stylelint'],
    \ 'cpp': ['clangtidy', 'clang-format'],
    \ 'markdown': ['prettier'],
    \ 'tex': ['latexindent'],
    \ 'bib': ['bibclean']
\ }

let g:ale_linter_aliases = {'vue': ['vue', 'javascript', 'css']}
let g:ale_linters_explicit = 1
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_lint_on_text_changed = 'never'

nmap [a <Plug>(ale_previous_wrap)
nmap ]a <Plug>(ale_next_wrap)
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>ag :ALEGoToDefinition<CR>
nnoremap <leader>ar :ALEFindReferences<CR>
nnoremap <leader>ah :ALEHover<CR>

" nvim tree lua ----------------------------------

lua << EOF
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  git                 = {
    ignore = false
  }
}
EOF
nnoremap <silent> <leader>n :NvimTreeToggle<CR>
nnoremap <silent> <leader>tt :NvimTreeToggle<CR>
nnoremap <silent> <leader>tn :NvimTreeToggle<CR>
nnoremap <silent> <leader>tr :NvimTreeRefresh<CR>
nnoremap <silent> <leader>tf :NvimTreeFindFile<CR>

" goyo limelight ---------------------------------

autocmd! User GoyoEnter nested set eventignore=FocusGained
autocmd! User GoyoLeave nested set eventignore=
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'

nnoremap <silent> <leader>zz :Goyo<CR>

" lightline --------------------------------------

let g:lightline = {
    \ 'colorscheme': 'miramare',
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
        \ 'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'gitbranch', 'filetype' ] ]
    \ },
    \ 'tabline': {
        \ 'left': [ ['buffers'] ]
    \ },
    \ 'component_function': {
        \ 'gitbranch': 'FugitiveHead'
    \ },
    \ 'component_expand': {
        \ 'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
        \ 'buffers': 'tabsel'
    \ }
\ }

set showtabline=2

" startify ---------------------------------------

let g:dashboard_default_executive ='fzf'

autocmd Filetype dashboard nnoremap <buffer> <silent> <Leader>fh :DashboardFindHistory<CR>
autocmd Filetype dashboard nnoremap <buffer> <silent> <Leader>ff :DashboardFindFile<CR>
autocmd Filetype dashboard nnoremap <buffer> <silent> <Leader>tc :DashboardChangeColorscheme<CR>
autocmd Filetype dashboard nnoremap <buffer> <silent> <Leader>fa :DashboardFindWord<CR>
autocmd Filetype dashboard nnoremap <buffer> <silent> <Leader>fm :DashboardJumpMark<CR>
autocmd Filetype dashboard nnoremap <buffer> <silent> <Leader>cn :DashboardNewFile<CR>

let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]
let g:indentLine_fileTypeExclude = ['dashboard']
autocmd FileType dashboard set showtabline=0 
autocmd BufEnter * set showtabline=2
let s:disable_statusline = 1

" general ----------------------------------------

" set termguicolors
colo oceanic_material
set background=dark
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40


set nobackup
set noswapfile
set nowritebackup
set noshowmode

syntax on
set mouse=a             " use mouse in vim
set expandtab           " tabs are spaces
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

noremap gp "0p

" -- Misc ---------------------------------------

let g:gutentags_cache_dir = '~/.config/ctags'

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


" " new coq and lsp stuff

" sign define LspDiagnosticsSignError text=🔴
" sign define LspDiagnosticsSignWarning text=🟠
" sign define LspDiagnosticsSignInformation text=🔵
" sign define LspDiagnosticsSignHint text=🟢

" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gb    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> gk    <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
" nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>

" nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
" xmap <silent> ga        <cmd>lua vim.lsp.buf.range_code_action()<CR>

" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect

" " Avoid showing message extra message when using completion
" set shortmess+=c

" " Set recommended to false
" let g:coq_settings = {
"             \"keymap.recommended": v:false,
"             \"keymap.jump_to_mark": "gm",
"             \"auto_start": "shut-up",
"             \}

" " Keybindings
" ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
" ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
" ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
" ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
" ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

" luafile ~/.config/nvim/lsp_config.lua

