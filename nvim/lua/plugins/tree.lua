return {
  {
    'kyazdani42/nvim-tree.lua',
    opts = {},
    keys = {
      { '<C-n>', ':NvimTreeToggle<CR>', desc = 'Toggle file tree' },
      { '<leader>e', ':NvimTreeFindFile<CR>', desc = 'Find file in tree' },
    },
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
  },
}
