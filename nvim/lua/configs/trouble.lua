local map = require('utils').map

require('trouble').setup()

map('n', '<leader>x', ':TroubleToggle<CR>', 'toggle trouble')
