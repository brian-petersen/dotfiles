" Brian Petersen's .vimrc

" Initial
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "


" Vundle Setup
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
Plugin 'sickill/vim-monokai'

call vundle#end()
filetype plugin indent on


" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0


" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global toggles
nnoremap <leader>ts :SyntasticToggleMode<CR>
nmap <leader>tl :set list!<CR>

" Syntax checker
nnoremap <leader>sc :SyntasticCheck<CR>

" File
nnoremap <Leader>fs :w<CR>
map <Leader>fl :NERDTreeToggle<CR>

" Delete
nnoremap <Leader>dt :%s/\s\+$//<CR>


" Other Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" exit insert mode quickly
:imap fd <Esc>

" open files quickly
nnoremap <Leader>o :CtrlP<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>


" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
colorscheme monokai

set ic
set so=3
set ruler
set showcmd
set incsearch
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

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects
    " .gitignore
    let g:ctrlp_user_command='ag -Q -l --nocolor --hidden -g "" %s'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching=0
endif

" Open new split panes to right and bottom
set splitbelow
set splitright

" Source local vimrc
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
