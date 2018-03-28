" Initial
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "


" Plugin List
"""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" tpope is a boss
Plug 'tpope/vim-fugitive'
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

" make it pretty
Plug 'junegunn/seoul256.vim'
Plug 'bling/vim-airline'

" match html elements
Plug 'tmhedberg/matchit'

" visualize undo
Plug 'sjl/gundo.vim'

" emmett
Plug 'mattn/emmet-vim'

" autocomplete
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-jedi'

Plug 'rhysd/devdocs.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'

" Polyglot (syntax stuff)
Plug 'sheerun/vim-polyglot'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Clipboard
Plug 'kana/vim-fakeclip'

" Other
Plug 'posva/vim-vue'

Plug 'editorconfig/editorconfig-vim'

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

" Delete
nnoremap <Leader>dt :%s/\s\+$//<CR>

" Tabs
nnoremap <leader>Tn :tabnew<CR>
nnoremap <leader>Tc :tabclose<CR>
nnoremap <leader>To :tabonly<CR>

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

" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

syntax on

colorscheme seoul256

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
