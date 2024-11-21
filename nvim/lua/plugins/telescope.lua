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
    keys = {
      { '<leader>p', require('telescope.builtin').find_files, desc = 'Find files' },
      { '<leader>sh', require('telescope.builtin').help_tags, desc = '[S]earch [H]elp' },
      { '<leader>sk', require('telescope.builtin').keymaps, desc = '[S]earch [K]eymaps' },
      { '<leader>ss', require('telescope.builtin').builtin, desc = '[S]earch [S]elect Telescope' },
      { '<leader>sw', require('telescope.builtin').grep_string, desc = '[S]earch current [W]ord' },
      { '<leader>sg', require('telescope.builtin').live_grep, desc = '[S]earch by [G]rep' },
      { '<leader>sd', require('telescope.builtin').diagnostics, desc = '[S]earch [D]iagnostics' },
      { '<leader>sr', require('telescope.builtin').resume, desc = '[S]earch [R]esume' },
    },
  },
}
