local map = require('utils').map

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<C-k>'] = 'move_selection_previous',
        ['<C-j>'] = 'move_selection_next',
      },
      n = {
        ['<C-c>'] = 'close',
      },
    },
  },
})

map('n', '<leader>p', '<cmd>Telescope find_files<cr>', 'find files')
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', 'find files')
map('n', '<leader>fa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>', 'find all files')
map('n', '<leader>fw', '<cmd>Telescope live_grep<cr>', 'live grep')
map('n', '<leader>tk', '<cmd>Telescope keymaps<cr>', 'show keys')
map('n', '<leader>sw', require('telescope.builtin').grep_string, 'search for word under cursor')
