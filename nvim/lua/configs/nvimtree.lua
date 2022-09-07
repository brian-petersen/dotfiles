local map = require('utils').map
local api = require('nvim-tree.api')

require('nvim-tree').setup()

map('n', '<C-n>', api.tree.toggle, 'toggle file tree')
map('n', '<leader>e', ':NvimTreeFindFile<CR>', 'toggle file tree')
