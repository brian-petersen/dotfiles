return {
  -- bless tpope
  { 'tpope/vim-unimpaired' }, -- additional ] and [ related keybindings
  { 'tpope/vim-repeat' },     -- repeat last command
  { 'tpope/vim-sleuth' },     -- auto indent detection

  -- surround motions (inspired by tpope)
  {
    'kylechui/nvim-surround',
    opts = {},
  },
  
  -- better tmux navigation
  { 'christoomey/vim-tmux-navigator' },

  -- better % matching (like ruby, elixir, etc)
  {
    'windwp/nvim-autopairs',
    opts = {},
  },
}
