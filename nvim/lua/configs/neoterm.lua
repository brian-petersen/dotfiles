local map = require('utils').map

vim.cmd('let g:neoterm_default_mod = "botright vertical"')

map('n', '<leader>tt', ':Ttoggle<CR>', 'toggle test pane')
