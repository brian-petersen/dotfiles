vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('config.lazy')

require('mappings')
require('lsp')
require('folding')

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

-- Interval for writing swap file to disk
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
vim.opt.signcolumn = 'yes'

-- Highlight the current line
vim.opt.cursorline = true

-- Highlight matching bracket
vim.opt.showmatch = true

-- Auto reload file when changed outside of vim
vim.opt.autoread = true

-- Enable basic mouse support
vim.opt.mouse = 'a'

-- Support undofile saving
vim.opt.undofile = true
