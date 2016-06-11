" Leader
let mapleader=" "

" Vundle Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Begin plugins
Plugin 'VundleVim/Vundle.vim'

Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

Plugin 'ciaranm/detectindent'
" Plugin 'Chiel92/vim-autoformat'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tpope/vim-commentary'  " gcc, gc:motion
" Plugin 'godlygeek/tabular'

Plugin 'jmcantrell/vim-virtualenv'

Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

" Search for anything
Plugin 'rking/ag.vim'  " :help ag-mappings

Plugin 'crusoexia/vim-monokai'
Plugin 'altercation/vim-colors-solarized'

Plugin 'mattn/emmet-vim'

call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


" YouCompleteMe settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ycm_python_binary_path='/home/brian/.pyenv/versions/3.4.4/bin/python'
nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>gg :YcmCompleter GetDoc<CR>


" Emmet settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_install_global=0
autocmd FileType html,css,htmldjango EmmetInstall


" Closetag settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:closetag_filenames="*.html,*.xhtml,*.phtml"


" Syntastic settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>st :SyntasticToggleMode<CR>
nnoremap <leader>sc :SyntasticCheck<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Syntastic python setup
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'  " ignore over 80


" Other General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=SourceCodePro-Regular:h12

set so=3  " Provide spacing around edges

set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line

" Sane tab settings
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Color and theme
syntax enable
if has("gui_running")
    set background=dark
    colorscheme solarized
else
    colorscheme monokai
endif

" Centralize swap, backup and undo files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set colorcolumn=81

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags='li\|p'

" Numbers
set number
set relativenumber
set numberwidth=5

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Always use vertical diffs
set diffopt+=vertical

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Ignore case search
set ic

" Nerdtree sidebar
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup=0

" Enter into normal mode quickly
:imap jj <Esc>

" Quickly save and open files
nnoremap <Leader>w :w<CR>
nnoremap <Leader>o :CtrlP<CR>

" System copy and paste
vmap <Leader>y "*y
vmap <Leader>d "*d
nmap <Leader>Y "*Y
nmap <Leader>p "*p
nmap <Leader>P "*P
vmap <Leader>p "*p
vmap <Leader>P "*P
