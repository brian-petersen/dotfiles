return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'onedark',
      },
      sections = {
        lualine_c = { { 'filename', path = 1 } },
      },
    },
    dependencies = {
      'onedark.nvim',
      'nvim-web-devicons',
    },
  },
}
