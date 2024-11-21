return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },

  {
    'tpope/vim-fugitive',
    lazy = false,
    keys = {
      { '<leader>g', ':Git<CR>', desc = 'Open git' },
    },
  },

  -- github integration for fugitive
  { 'tpope/vim-rhubarb' },  
}
