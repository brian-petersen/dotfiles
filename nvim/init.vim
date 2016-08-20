" Initial {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
" }}}

" Plugin list {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" tpope is a boss
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

" git diffs
Plug 'airblade/vim-gitgutter'

" search for project files
Plug 'kien/ctrlp.vim'

" syntax checker
Plug 'neomake/neomake'

" search everything
Plug 'eugen0329/vim-esearch'

" get a pretty status bar
Plug 'bling/vim-airline'

" get file browser
Plug 'scrooloose/nerdtree'

" make buffer management
Plug 'jlanzarotta/bufexplorer'

" match html elements
Plug 'tmhedberg/matchit'

" make it pretty
Plug 'tomasr/molokai'

" visualize undo
Plug 'sjl/gundo.vim'

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" autocomplete
Plug 'Valloric/YouCompleteMe'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()
" }}}

" Plugin Configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neomake {{{
autocmd! BufWritePost,BufEnter * Neomake

let g:neomake_warning_sign = {
    \ 'text': 'W',
    \ 'texthl': 'WarningMsg',
    \ }

let g:neomake_error_sign = {
    \ 'text': 'E',
    \ 'texthl': 'ErrorMsg',
    \ }
" }}}

" YouCompleteMe {{{
let g:ycm_autoclose_preview_window_after_insertion=1
" }}}

" CtrlP {{{
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command='ag -Q -l --nocolor --hidden -g "" %s'
    let g:ctrlp_use_caching=0
endif
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets = "<c-k>"
" }}}

" Commentary {{{
autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}
" }}}

" Surround {{{
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
" }}}
" }}}

" Keybindings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global toggles
nmap <leader>tS :set spell!<CR>
nmap <leader>tw :set wrap!<CR>
nmap <leader>tl :set list!<CR>

" Errors
nnoremap <leader>ec :Neomake<CR>
nnoremap <leader>el :lopen<CR>
nnoremap <leader>en :lnext<CR>
nnoremap <leader>ep :lprevious<CR>

" Search
call esearch#map('<leader>ss', 'esearch')
call esearch#map('<leader>sw', 'esearch-word-under-cursor')
nnoremap <leader>sc :nohlsearch<CR>

" File
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>fed :vsp $MYVIMRC<CR>
nnoremap <Leader>feR :source $MYVIMRC<CR>
nmap <Leader>fl :NERDTreeToggle<CR>

" Delete
nnoremap <Leader>dt :%s/\s\+$//<CR>

" Goto
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
" }}}

" Other Keybindings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" exit insert mode quickly
imap fd <Esc>
tmap fd <C-\><C-n>

" open files quickly
nnoremap <Leader>o :CtrlP<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" move by vertical line
nnoremap j gj
nnoremap k gk

" move to beginning and end of lines
nnoremap B ^
nnoremap E $

" select last inserted text
nnoremap gV `[v`]

" gundo
nnoremap <leader>u :GundoToggle<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" }}}

" General settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
let g:rehash256=1  " get the darker syntax for molokai
colorscheme molokai

set pastetoggle=<F2>

set wildmenu
set lazyredraw
set showmatch

set foldenable
set foldmethod=indent
set foldlevel=99

set ignorecase
set smartcase
set incsearch
set hlsearch

set scrolloff=3
set ruler
set showcmd
set laststatus=2

" Numbers
set number
set relativenumber
set numberwidth=5

" Sane tab settings
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Always use vertical diffs
set diffopt+=vertical

" Centralize swap, backup and undo files
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nivm/swap//
set undodir=~/.config/nvim/undo//

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set colorcolumn=81

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags='li\|p'

" Open new split panes to right and bottom
set splitbelow
set splitright
" }}}

" vim: set foldmethod=marker foldlevel=0:
