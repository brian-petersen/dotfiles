-- Does not include plugin related mappings.
-- Thosse are found in `plugins`.

local map = require('utils').map

map('i', 'fd', '<Esc>', 'exit insert mode')

map('n', '<leader><leader>', '<C-^>', 'toggle buffer')

map('n', '<leader>fs', ':w<CR>', 'save file')

map('n', 'j', 'gj', 'move vertical line')
map('n', 'k', 'gk', 'move vertical line')

map('n', 'gV', '`[v`]', 'select last inserted text')

map('n', 'Y', 'y$', 'fix copy')

map('n', '<leader>Tn', ':tabnew<CR>', 'new tab')
map('n', '<leader>Tc', ':tabclose<CR>', 'close tab')
map('n', '<leader>To', ':tabonly<CR>', 'only tab')

map('n', '<leader>g', ':Git<CR>', 'only git')

map('n', '<leader>dt', ':%s/\\s\\+$//<CR>', 'trim trailing whitespace')

map('n', '<leader>sc', ':nohlsearch<CR>', 'clear search highlight')
