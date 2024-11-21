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

map('n', '<leader>pp', '<cmd>Telescope find_files<cr>', 'find files')
map('n', '<leader>pa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>', 'find all files')
map('n', '<leader>ss', '<cmd>Telescope live_grep<cr>', 'live grep')
map('n', '<leader>sw', require('telescope.builtin').grep_string, 'search for word under cursor')
map('n', '<leader>k', '<cmd>Telescope keymaps<cr>', 'show keys')
