--
-- General LSP related config
--
vim.diagnostic.config({
  -- Enable diagnostics info to show up next to function
  virtual_text = true,
})

--
-- Set up and register configs
--
local configs = {
  elixirls = {
    cmd = { 'elixir-ls' },
    root_markers = { 'mix.exs' },
    filetypes = { 'elixir', 'eelixir', 'heex', 'surface' },
  },

  rust_analyzer = {
    cmd = { 'rust-analyzer' },
    root_markers = { 'Cargo.toml' },
    filetypes = { 'rust' },
  },
}

for name, config in pairs(configs) do
  vim.lsp.config[name] = config
end

--
-- Custom functions and commands
--
local stop_servers = function()
  vim.lsp.stop_client(vim.lsp.get_clients())
end

local disable_servers = function()
  for name in pairs(configs) do
    vim.lsp.enable(name, false)
  end
end

local enable_servers = function()
  for name in pairs(configs) do
    vim.lsp.enable(name)
  end
end

vim.api.nvim_create_user_command('LspEnable', function()
  enable_servers()
end, {})

vim.api.nvim_create_user_command('LspDisable', function()
  stop_servers()
  disable_servers()
end, {})

vim.api.nvim_create_user_command('LspStop', function()
  stop_servers()
end, {})

-- Set up custom keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { buffer = true, desc = 'Go to definition' })
    vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, { buffer = true, desc = 'List references' })
    vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, { buffer = true, desc = 'Open diagnostic window' })
    vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format() end, { buffer = true, desc = 'Format file' })

    vim.keymap.set('n', 'gO', function() require('telescope.builtin').lsp_document_symbols() end, { buffer = true, desc = 'Document symbols' })
    vim.keymap.set('n', 'gW', function() require('telescope.builtin').lsp_workspace_symbols() end, { buffer = true, desc = 'Workspace symbols' })
  end
})

-- Enable servers by default
enable_servers()
