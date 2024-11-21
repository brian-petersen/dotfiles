return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local lspconfig = require('lspconfig')

      -- Override default capabilities advertised to
      -- lsp servers to work with autocomplete.
      lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig.util.default_config.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      -- brew install elixir-ls
      lspconfig.elixirls.setup({
        cmd = { 'elixir-ls' },
      })

      -- gleam binary
      lspconfig.gleam.setup({})

      -- brew install typesript-language-server
      lspconfig.ts_ls.setup({})

      -- rustup component add rust-analyzer
      lspconfig.rust_analyzer.setup({})

      -- brew install pyright
      lspconfig.pyright.setup({})

      -- Additional lsp set up
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          -- Lsp specific keybindings
          vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { buffer = true, desc = 'Go to definition' })
          vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, { buffer = true, desc = 'List references' })
          vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, { buffer = true, desc = 'Open diagnostic window' })
          vim.keymap.set('i', '<C-s>', function() vim.lsp.buf.signature_help() end, { buffer = true, desc = 'Signature window' })
          vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, { buffer = true, desc = 'Rename symbol' })
          vim.keymap.set('n', '<leader>.', function() vim.lsp.buf.code_action() end, { buffer = true, desc = 'Code action' })

          -- Telescope related lsp keybindings
          vim.keymap.set('n', 'gO', function() require('telescope.builtin').lsp_document_symbols() end, { buffer = true, desc = 'Document symbols' })
          vim.keymap.set('n', 'gW', function() require('telescope.builtin').lsp_workspace_symbols() end, { buffer = true, desc = 'Workspace symbols' })

          -- Format the current buffer on save
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  },
}
