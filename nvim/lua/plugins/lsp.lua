return {
  'neovim/nvim-lspconfig',
  config = function()
    --
    -- General LSP related config
    --
    vim.diagnostic.config({
      -- Enable diagnostics info to show up next to function
      virtual_text = true,
    })

    -- Options: 'trace', 'debug', 'info', 'warn', 'error', 'off'
    vim.lsp.set_log_level('warn')

    --
    -- Set up and register configs.
    --
    -- See https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/configs
    -- or `:h lspconfig-all` for a starting point if needed.
    --
    local get_lsp_config = function(server, cfg)
      cfg = cfg or {}
      vim.lsp.config(server, cfg)
      return vim.lsp.config[server]
    end

    local configs = {
      copilot = get_lsp_config('copilot'),
      elixirls = get_lsp_config('elixirls', { cmd = { 'elixir-ls' } }),
      gopls = get_lsp_config('gopls'),
      lua_ls = get_lsp_config('lua_ls'),
      rust_analyzer = get_lsp_config('rust_analyzer'),
      ts_ls = get_lsp_config('ts_ls'),
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
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { buffer = true, desc = 'Go to definition' })

        vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end,
          { buffer = true, desc = 'List references' })

        vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end,
          { buffer = true, desc = 'Open diagnostic window' })

        vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format() end, { buffer = true, desc = 'Format file' })

        vim.keymap.set('n', 'gO', function() require('telescope.builtin').lsp_document_symbols() end,
          { buffer = true, desc = 'Document symbols' })

        vim.keymap.set('n', 'gW', function() require('telescope.builtin').lsp_workspace_symbols() end,
          { buffer = true, desc = 'Workspace symbols' })
      end
    })

    -- Enable servers by default
    enable_servers()
  end,
}
