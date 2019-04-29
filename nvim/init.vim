" Initial
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "


" Plugin List
"""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" tpope is a boss
Plug 'tpope/vim-sensible'  " sensible defaults
Plug 'tpope/vim-fugitive'  " git wrapper
Plug 'tpope/vim-surround'  " surrounding characters
Plug 'tpope/vim-commentary'  " comment out things
Plug 'tpope/vim-unimpaired'  " additional ] and [ related keybindings
Plug 'tpope/vim-repeat'  " repeat last command
Plug 'tpope/vim-sleuth'  " auto indent detection
Plug 'tpope/vim-dispatch'  " asynchronous actions

" git diffs
Plug 'airblade/vim-gitgutter'

" search for project files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" search everything
Plug 'mileszs/ack.vim'

" make it pretty
Plug 'nanotech/jellybeans.vim'  " syntax theme
Plug 'itchyny/lightline.vim'  " pretty status bar

" IDE
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'w0rp/ale'

" Polyglot
Plug 'sheerun/vim-polyglot'  " latest syntax grammars

" Tmux
Plug 'christoomey/vim-tmux-navigator'  " navigate to tmux panes

" Clipboard
Plug 'kana/vim-fakeclip'  " use system clipboard properly (WSL, macOS, etc.)

" Writing
Plug 'junegunn/goyo.vim'  " distraction free editing

" Test
Plug 'janko/vim-test'

" Other
Plug 'terryma/vim-multiple-cursors'  " multiple cursors
Plug 'scrooloose/nerdtree'  " file explorer panel
Plug 'nathanaelkane/vim-indent-guides'  " indent guides
Plug 'shumphrey/fugitive-gitlab.vim'  " adds gitlab support in fugitive
Plug 'kassio/neoterm'  " smart neoterminal usage

call plug#end()


" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Silver Searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m

  " use Ag instead of ack
  let g:ackprg = 'ag --vimgrep'
endif

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
let g:neoterm_default_mod = "rightbelow"
let g:neoterm_size = 15
let g:neoterm_autoscroll = 1

" CoC
autocmd CursorHold * silent call CocActionAsync('highlight')  " Highlight symbol under cursor on CursorHold

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Fugitive Gitlab
let g:fugitive_gitlab_domains = ['https://git-p1ap1.divvy.co']


" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Old habbits die hard
nnoremap <leader>p :GFiles<CR>

" Toggles
nmap <leader>tS :set spell!<CR>
nmap <leader>tw :set wrap!<CR>
nmap <leader>tl :set list!<CR>

nnoremap <leader>ts :ALEToggle<CR>
nnoremap <leader>tg :Goyo<CR>
nnoremap <leader>ti :IndentGuidesToggle<CR>
nnoremap <leader>tt :Ttoggle<CR>

" List
nnoremap <leader>lb :Buffers<CR>
nnoremap <leader>lt :Tags<CR>

nnoremap <silent> <leader>lo  :<C-u>CocList outline<cr>

" Search
nnoremap <leader>ss :Ack<Space>
nnoremap <leader>sw :Ack <C-r><C-w><CR>
nnoremap <leader>sc :nohlsearch<CR>

" File
nnoremap <leader>fs :w<CR>
nnoremap <leader>fed :vsp $MYVIMRC<CR>
nnoremap <leader>feR :source $MYVIMRC<CR>
nmap <leader>ff <Plug>(coc-format)

" Delete
nnoremap <leader>dt :%s/\s\+$//<CR>

" Tabs
nnoremap <leader>Tn :tabnew<CR>
nnoremap <leader>Tc :tabclose<CR>
nnoremap <leader>To :tabonly<CR>

" Goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Refactor
nmap <leader>rn <Plug>(coc-rename)

" Completion/Intellisense
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

" Snippets
imap <C-k> <Plug>(neosnippet_expand_or_jump)  

" Navigate
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Testing
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-b> :TestFile<CR>
nmap <silent> t<C-l> :TestLast<CR>

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

" Better display for messages
set cmdheight=2

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

" If hidden is not set, TextEdit might fail
set hidden

" Smaller updatetime for CursorHold and CursorHoldI (for linting)
set updatetime=300

" Don't show |ins-completion-menu| messages
set shortmess+=c

" Always show signcolumns (git gutter, errors, etc.)
set signcolumn=yes

" Source local vimrc
if filereadable(glob("~/.nvim.local"))
  source ~/.nvim.local
endif
