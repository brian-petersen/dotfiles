" Initial
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "


" Plugin List
"""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" tpope is a boss
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'

" git diffs
Plug 'airblade/vim-gitgutter'

" search for project files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" syntax checker
Plug 'w0rp/ale'

" search everything
Plug 'mileszs/ack.vim'

" make it pretty
Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/lightline.vim'

" autocomplete
Plug 'Shougo/deoplete.nvim'
Plug 'slashmili/alchemist.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Polyglot (syntax stuff)
Plug 'sheerun/vim-polyglot'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Clipboard
Plug 'kana/vim-fakeclip'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'

" Test
Plug 'janko/vim-test'
Plug 'tpope/vim-dispatch'

" Other
Plug 'terryma/vim-multiple-cursors'

call plug#end()


" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Silver Searcher
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

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

" Lightline
let g:lightline = {
            \ 'component_function': {
            \   'filename': 'LightlineFilename',
            \ }
            \ }

function! LightlineFilename()
    let root = fnamemodify(get(b:, 'git_dir'), ':h')
    let path = expand('%:p')

    if path[:len(root)-1] ==# root
        return path[len(root)+1:]
    endif

    return expand('%')
endfunction

" Testing
let test#strategy = "dispatch"


" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggles
nnoremap <leader>ts :ALEToggle<CR>
nnoremap <leader>tg :Goyo<CR>
nnoremap <leader>tp :PencilToggle<CR>
nmap <leader>tS :set spell!<CR>
nmap <leader>tw :set wrap!<CR>
nmap <leader>tl :set list!<CR>

" Open
nnoremap <leader>of :Files<CR>
nnoremap <leader>ob :Buffers<CR>
nnoremap <leader>ot :Tags<CR>
nnoremap <leader>os :Snippets<CR>

" Errors
nnoremap <leader>ec :ALELint<CR>

" Search
nnoremap <Leader>ss :Ag<Space>
nnoremap <Leader>sw :Ag <C-r><C-w><CR>
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


" Miscellaneous Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open :ex lazily (shift is hard to reach sometimes)
nmap <leader>; :

" Exit insert mode quickly
imap fd <Esc>

" Toggle between the last two files
nnoremap <leader><leader> <c-^>

" Move by vertical line
nnoremap j gj
nnoremap k gk

" Select last inserted text
nnoremap gV `[v`]

" Fix Y
nnoremap Y y$

" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme jellybeans

" Delete through these without weirdness
set backspace=indent,eol,start

" Toggle this mode to paste without auto formatting
set pastetoggle=<F2>

" Auto reload file when changed outside of vim
set autoread

" Show possible options while typing in :ex
set wildmenu
set wildmode=longest:full,full

" Postpone redrawing with macros, etc.
set lazyredraw

" Highlight matching bracket
set showmatch

" Highlight the current line
set cursorline

" Folding
set foldenable
set foldmethod=syntax
set foldlevel=99  " open files with folds open

" Search options
set ignorecase
set smartcase
set incsearch
set hlsearch

" Provide spacing at beginning and ends of files
set scrolloff=3

" Show line:col in status bar
set ruler

" Show previous command in :ex
set showcmd

" Line numbers
set number
set relativenumber
set numberwidth=5

" Sane tab settings
set autoindent  " match current line with o of O
set smartindent " do so smartly
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=-1 " negative so shiftwidth is used
set shiftround     " round to multiples of shiftwidth

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Always use vertical diffs
set diffopt+=vertical

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set colorcolumn=80

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_inctags = "html,body,head,tbody,li,p"

" Open new split panes to right and bottom
set splitbelow
set splitright

" Source local vimrc
if filereadable(glob("~/.nvim.local"))
    source ~/.nvim.local
endif
