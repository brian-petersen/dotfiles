" Brian Petersen's .vimrc

" Initial {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
" }}}

" Vundle Setup {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle itself
Plugin 'VundleVim/Vundle.vim'

" tpope is a boss
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'

" search for project files
Plugin 'kien/ctrlp.vim'

" syntax checker
Plugin 'scrooloose/syntastic'

" search everything
Plugin 'rking/ag.vim'

" get a pretty status bar
Plugin 'bling/vim-airline'

" get file browser
Plugin 'scrooloose/nerdtree'

" make buffer management
Plugin 'jlanzarotta/bufexplorer'

" match html elements
Plugin 'tmhedberg/matchit'

" make it pretty
Plugin 'tomasr/molokai'

" visualize undo
Plugin 'sjl/gundo.vim'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" autocomplete
Plugin 'Valloric/YouCompleteMe'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on
" }}}

" Plugins {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
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
nnoremap <leader>ts :SyntasticToggleMode<CR>
nmap <leader>tS :set spell!<CR>
nmap <leader>tw :set wrap!<CR>
nmap <leader>tl :set list!<CR>

" Errors
nnoremap <leader>ec :SyntasticCheck<CR>

" Search
nnoremap <leader>sc :nohlsearch<CR>

" File
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>fed :vsp $MYVIMRC<CR>
nnoremap <Leader>feR :source $MYVIMRC<CR>
nmap <Leader>fl :NERDTreeToggle<CR>

" Delete
nnoremap <Leader>dt :%s/\s\+$//<CR>
" }}}

" Goto {{{
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
" }}}

" Other Keybindings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" exit insert mode quickly
:imap fd <Esc>

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
" }}}

" General settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
let g:rehash256=1
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

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Always use vertical diffs
set diffopt+=vertical

" Centralize swap, backup and undo files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set colorcolumn=81

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags='li\|p'

" Open new split panes to right and bottom
set splitbelow
set splitright

" Source local vimrc
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
" }}}

" vim: set foldmethod=marker foldlevel=0:
