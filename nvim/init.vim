" Brian Petersen's init.vim

" Initial {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
" }}}

" Plugin List {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" tpope is a boss
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" git diffs
Plug 'airblade/vim-gitgutter'

" detect indent
Plug 'ciaranm/detectindent'

" search for project files
Plug 'kien/ctrlp.vim'

" syntax checker
" Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'  " neovim

" search everything
Plug 'mileszs/ack.vim'

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

" Python specific
Plug 'hynek/vim-python-pep8-indent'
Plug 'tmhedberg/simpylfold'

" Polyglot
Plug 'sheerun/vim-polyglot'

" Tmux
" Plug 'christoomey/vim-tmux-navigator'

" Notes
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

call plug#end()
" }}}

" Plugin Configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic {{{
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_check_on_wq=0
" }}}

" Neomake (neovim) {{{
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

" Airline {{{
" let g:airline#extensions#syntastic#enabled = 1
" }}}

" YouCompleteMe {{{
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_insertion=1
" }}}

" Silver Searcher {{{
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use Ag for ctrlp searches
    let g:ctrlp_user_command='ag -Q -l --nocolor --hidden -g "" %s'
    let g:ctrlp_use_caching=0

    " use Ag instead of ack
    let g:ackprg = 'ag --vimgrep'
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

" Simpyl Folding {{{
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
" }}}

" DetectIndent {{{
let g:detectindent_preferred_when_mixed=1
" }}}

" Notes {{{
let g:notes_directories = ['~/Dropbox/Notes']
let g:notes_suffix = '.txt'
" }}}
" }}}

" Keybindings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global toggles
" nnoremap <leader>ts :SyntasticToggleMode<CR>
nmap <leader>tS :set spell!<CR>
nmap <leader>tw :set wrap!<CR>
nmap <leader>tl :set list!<CR>

" Errors
" nnoremap <leader>ec :SyntasticCheck<CR>
" nnoremap <leader>er :SyntasticReset<CR>
" neovim specific
nnoremap <leader>ec :Neomake<CR>

" Search
nnoremap <Leader>ss :Ack!<Space>
nnoremap <Leader>sw :Ack! <C-r><C-w>
nnoremap <leader>sc :nohlsearch<CR>

" File
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>fed :vsp $MYVIMRC<CR>
nnoremap <Leader>feR :source $MYVIMRC<CR>
nmap <Leader>fl :NERDTreeToggle<CR>

" Delete
nnoremap <Leader>dt :%s/\s\+$//<CR>

" Tabs
nnoremap <leader>Tn :tabnew<CR>
nnoremap <leader>Tc :tabclose<CR>
nnoremap <leader>To :tabonly<CR>

" Goto
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>

" Location list
nnoremap <leader>lo :lopen<CR>
nnoremap <leader>lc :lclose<CR>

" Location list
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>
" }}}

" Other Keybindings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" exit insert mode quickly
imap fd <Esc>
" neovim specific
tmap fd <C-\><C-n>

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
" Currently defined in vim-tmux-navigator plugin
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" neovim specific
" tnoremap <C-h> <C-\><C-n><C-w>h
" tnoremap <C-j> <C-\><C-n><C-w>j
" tnoremap <C-k> <C-\><C-n><C-w>k
" tnoremap <C-l> <C-\><C-n><C-w>l
if has('nvim')
     nmap <BS> <C-w>h
 endif
" }}}

" General settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
let g:rehash256=1  " get the darker syntax for molokai
colorscheme molokai

set pastetoggle=<F2>

" set autoread

" set wildmenu
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
" set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//
" set undodir=~/.vim/undo//
set backupdir=~/.config/nvim/backup//  " neovim
set directory=~/.config/nvim/swap//  " neovim
set undodir=~/.config/nvim/undo//  " neovim

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set colorcolumn=80

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_inctags = "html,body,head,tbody,li,p"

" Open new split panes to right and bottom
set splitbelow
set splitright
" }}}

" Source local vimrc
" if filereadable(glob("~/.vimrc.local"))
"     source ~/.vimrc.local
" endif

" vim: set foldmethod=marker foldlevel=0:
