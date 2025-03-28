local map = function(mode, lhs, rhs, label, opts)
  local options = { noremap = true, desc = label }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.keymap.set(mode, lhs, rhs, options)
end


map('i', 'fd', '<Esc>', 'Exit insert mode')
map('t', 'fd', '<C-\\><C-n>', 'Exit insert mode')

map('n', '<leader><leader>', '<C-^>', 'Toggle buffer')

map('n', '<leader>fs', ':w<CR>', 'Save file')

map('n', 'j', 'gj', 'Move vertical line')
map('v', 'j', 'gj', 'Move vertical line')
map('n', 'k', 'gk', 'Move vertical line')
map('v', 'k', 'gk', 'Move vertical line')

map('n', 'gV', '`[v`]', 'Select last inserted text')

map('n', 'Y', 'y$', 'Fix copy')

map('n', '<leader>Tn', ':tabnew<CR>', 'New tab')
map('n', '<leader>Tc', ':tabclose<CR>', 'Close tab')
map('n', '<leader>To', ':tabonly<CR>', 'Only tab')

map('n', '<leader>dt', ':%s/\\s\\+$//<CR>', 'Trim trailing whitespace')

map('n', '<leader>sc', ':nohlsearch<CR>', 'Clear search highlight')

local toggle_qf = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end

  if qf_exists then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end
map('n', 'yoq', toggle_qf, 'Toggle quickfix window')
