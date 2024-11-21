# Neovim Config

For further inspiration see https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua.

## Todo

- Syntax highlighting for eex files (Elixir templated HTML)
  - `ts-comments` is suppose to do this but doesn't work for whatever reason...
- `gc` shortcuts for JSX/React -- doesn't work when commenting out in a component
- Consider additional `telescope` shortcuts
  - Specifically LSP related pickers...

## Remaining Old Config

```lua
local plugins = function(use)
  use {
    'kassio/neoterm',
    config = function()
      require('configs.neoterm')
    end
  }

  use {
    'vim-test/vim-test',
    requires = 'kassio/neoterm',
    config = function()
      require('configs.vimtest')
    end
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        run = ':MasonUpdate',
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required

      -- Additional autocomplete sources
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'cmp-nvim-lsp' },

      -- Additional packages
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      local lsp = require('lsp-zero').preset({})
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()

      -- Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      -- Prettier icons for the side
      lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })

      lsp.ensure_installed({
        'jsonls',
        'lua_ls',
        'prismals',
        'pyright',
        'terraformls',
      })

      -- Set everything up
      lsp.setup()

      -- IMPORTANT everything below this needs to be set up after lsp-zero

      -- Load "friendly-snippets" installed above
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        -- Additional completion sources
        -- (But overrides ones setup by lsp-zero so have to include them all)
        sources = {
          { name = 'luasnip' },
        },

        -- Additional completion menu key bindings
        mapping = {
          -- Supertab like capabilities
          --   - Navigate between items
          --   - Trigger snippet
          --   - Jump between snippet placeholders
          --   - If in middle of word, display completion menu
          --   - Otherwise, like normal tab
          ['<Tab>'] = cmp_action.luasnip_supertab(),
          ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        },
      })
    end
  }
```
