vim.g.mapleader = ' '

require('plugins')
require('mappings')

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Show line:col in status bar
vim.opt.ruler = true

-- Indenting
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- Interval for writing swap file to disk, also used by gitsigns
vim.opt.updatetime = 250

-- " Search options
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Provide spacing at beginning and ends of files
vim.opt.scrolloff = 3

-- Open new split panes to right and bottom
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Always show signcolumns (git gutter, errors, etc.)
vim.opt.signcolumn = "yes"

-- Highlight the current line
vim.opt.cursorline = true

-- Highlight matching bracket
vim.opt.showmatch = true

-- Auto reload file when changed outside of vim
vim.opt.autoread = true

-- Other
vim.opt.mouse = "a"

vim.opt.timeoutlen = 400

vim.opt.undofile = true



-- TODO need to sort these out... don't seem to be working
-- vim.opt.laststatus = 3 -- global statusline
-- vim.opt.showmode = false

-- vim.opt.title = true
-- vim.opt.clipboard = "unnamedplus"
-- vim.opt.cursorline = true

-- vim.opt.fillchars = { eob = " " }



--- TODO these need to be ported over when ready
-- " Keybindings
-- """""""""""""""""""""""""""""""""""""""""""""""""""""

-- " File
-- nnoremap <leader>fed :vsp $MYVIMRC<CR>
-- nnoremap <leader>feR :source $MYVIMRC<CR>

-- " General settings
-- """""""""""""""""""""""""""""""""""""""""""""""""""""
-- " Delete through these without weirdness
-- set backspace=indent,eol,start

-- " Show possible options while typing in :ex
-- set wildmenu
-- set wildmode=longest:full,full

-- " Postpone redrawing with macros, etc.
-- set lazyredraw

-- " Show previous command in :ex
-- set showcmd

-- " Better display for messages
-- set cmdheight=2

-- " Display extra whitespace
-- set list listchars=tab:»·,trail:·,nbsp:·

-- " Always use vertical diffs
-- set diffopt+=vertical

-- " Use one space, not two, after punctuation.
-- set nojoinspaces

-- " Treat <li> and <p> tags like the block tags they are
-- let g:html_indent_inctags = "html,body,head,tbody,li,p"

-- " Don't show |ins-completion-menu| messages
-- set shortmess+=c
