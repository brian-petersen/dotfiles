return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = 'move_selection_previous',
            ['<C-j>'] = 'move_selection_next',
          },
        },
      },
    },
    lazy = false,
    keys = {
      { '<leader>p', ':Telescope find_files<CR>', desc = 'Find files' },
      { '<leader>sh', ':Telescope help_tags<CR>', desc = '[S]earch [H]elp' },
      { '<leader>sk', ':Telescope keymaps<CR>', desc = '[S]earch [K]eymaps' },
      { '<leader>ss', ':Telescope builtin<CR>', desc = '[S]earch [S]elect Telescope' },
      { '<leader>sw', ':Telescope grep_string<CR>', desc = '[S]earch current [W]ord' },
      { '<leader>sg', ':Telescope live_grep<CR>', desc = '[S]earch by [G]rep' },
      { '<leader>sd', ':Telescope diagnostics<CR>', desc = '[S]earch [D]iagnostics' },
      { '<leader>sr', ':Telescope resume<CR>', desc = '[S]earch [R]esume' },
    },
  },
}
