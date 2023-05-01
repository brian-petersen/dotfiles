local map = require('utils').map

vim.cmd('let test#strategy = "neoterm"')

map('n', 't<C-b>', ':TestFile<CR>', 'test buffer')
map('n', 't<C-l>', ':TestLast<CR>', 'test last')
map('n', 't<C-n>', ':TestNearest<CR>', 'test nearest')
