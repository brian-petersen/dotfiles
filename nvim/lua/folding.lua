-- Start unfolded
vim.opt.foldlevel = 100

-- Set fold method based on file type of buffer.
-- If I need a fallback: vim.opt.foldmethod = 'indent'
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    if require('nvim-treesitter.parsers').has_parser() then
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    else
      vim.opt.foldmethod = 'syntax'
    end
  end
})
