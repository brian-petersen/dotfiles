local M = {}

-- TODO figure something out with label with telescope
-- (<space>tk binding)
M.map = function(mode, lhs, rhs, label, opts)
  local options = { noremap = true }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.keymap.set(mode, lhs, rhs, options)
end

return M
