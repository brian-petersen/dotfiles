" Brian Petersen's init.vim


" Initial
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "


" Plugin List
"""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" tpope is a boss
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

" git diffs
Plug 'airblade/vim-gitgutter'

" detect indent
Plug 'ciaranm/detectindent'

" search for project files
Plug 'kien/ctrlp.vim'

" syntax checker
Plug 'w0rp/ale'

" search everything
Plug 'mileszs/ack.vim'

" get a pretty status bar
Plug 'bling/vim-airline'

" " get file browser
" Plug 'scrooloose/nerdtree'

" match html elements
Plug 'tmhedberg/matchit'

" make it pretty
Plug 'MaxSt/FlatColor'

" " visualize undo
Plug 'sjl/gundo.vim'

" autocomplete
Plug 'Shougo/deoplete.nvim'
Plug 'tweekmonster/deoplete-clang2'
Plug 'zchee/deoplete-jedi'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'

" Python specific
Plug 'hynek/vim-python-pep8-indent'

" Polyglot (syntax stuff)
Plug 'sheerun/vim-polyglot'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Autoclose
" Plug 'jiangmiao/auto-pairs'

" Clipboard
" Plug 'cazador481/fakeclip.neovim'
Plug 'kana/vim-fakeclip'

call plug#end()


" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:airline#extensions#ale#enabled = 1

" Silver Searcher
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use Ag for ctrlp searches
    let g:ctrlp_user_command='ag -Q -l --nocolor --hidden -g "" %s'
    let g:ctrlp_use_caching=0

    " use Ag instead of ack
    let g:ackprg = 'ag --vimgrep'
endif

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets = "<c-k>"

" deoplete
let g:deoplete#enable_at_startup=1

let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang/'

" DetectIndent
let g:detectindent_preferred_when_mixed=1


" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global toggles
nnoremap <leader>ts :ALEToggle<CR>
nmap <leader>tS :set spell!<CR>
nmap <leader>tw :set wrap!<CR>
nmap <leader>tl :set list!<CR>

" Errors
nnoremap <leader>ec :ALELint<CR>

" Search
nnoremap <Leader>ss :Ack!<Space>
nnoremap <Leader>sw :Ack! <C-r><C-w>
nnoremap <leader>sc :nohlsearch<CR>

" File
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>fed :vsp $MYVIMRC<CR>
nnoremap <Leader>feR :source $MYVIMRC<CR>
" nmap <Leader>fl :NERDTreeToggle<CR>

" Delete
nnoremap <Leader>dt :%s/\s\+$//<CR>

" Tabs
nnoremap <leader>Tn :tabnew<CR>
nnoremap <leader>Tc :tabclose<CR>
nnoremap <leader>To :tabonly<CR>

" Goto
" nnoremap <leader>gg :YcmCompleter GoTo<CR>
" nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
" nnoremap <leader>gd :YcmCompleter GetDoc<CR>

" Location list
nnoremap <leader>lo :lopen<CR>
nnoremap <leader>lc :lclose<CR>

" Quickfix list
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>

" Ctrlp mode
nnoremap <leader>pg :let g:ctrlp_working_path_mode = 'ra'<CR>
nnoremap <leader>pw :let g:ctrlp_working_path_mode = 'w'<CR>


" Other Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" exit insert mode quickly
imap fd <Esc>

" open files quickly
nnoremap <Leader>o :CtrlP<CR>

" toggle between the last two files
nnoremap <leader><leader> <c-^>

" move by vertical line
nnoremap j gj
nnoremap k gk

" select last inserted text
nnoremap gV `[v`]

" gundo
nnoremap <leader>u :GundoToggle<CR>

" fix Y
nnoremap Y y$

" Quicker split pane movement
" tmux plugin handles these
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l


" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
color flatcolor

set backspace=indent,eol,start

set pastetoggle=<F2>

set autoread

set wildmenu
set wildmode=longest:full,full

set lazyredraw
set showmatch

set cursorline

set foldenable
set foldmethod=syntax
set foldlevel=99  " open files with folds open

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
set autoindent  " match current line with o of O
set smartindent " do so smartly
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=-1 " negative so shiftwidth is used
set shiftround     " round to multiples of shiftwidth

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Always use vertical diffs
set diffopt+=vertical

" Centralize swap, backup and undo files
" set backupdir=~/.vim/backup/
" set directory=~/.vim/swap/
" set undodir=~/.vim/undo/

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set colorcolumn=120

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_inctags = "html,body,head,tbody,li,p"

" Open new split panes to right and bottom
set splitbelow
set splitright

" Source local vimrc
if filereadable(glob("~/.nvim.local"))
    source ~/.nvim.local
endif
