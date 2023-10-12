-- To add a new language, you'll want to
--
--   1. Get the treesitter parser
--      (Update 'ensure_installed' under 'nvim-treesitter/nvim-treesitter')
--      (See :TSInstallInfo for list of available options)
--
--   2. Add the language server
--      (Update 'ensure_installed' under 'lsp-zero')

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    print('Cloning packer...')

    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd('packadd packer.nvim')

    return true
  end

  return false
end

local installed_packer = ensure_packer()

local packer = require('packer')

local plugins = function(use)
  use { 'wbthomason/packer.nvim' }

  use { 'tpope/vim-fugitive' }   -- git wrapper
  use { 'tpope/vim-rhubarb' }    -- github integration for fugitive
  use { 'tpope/vim-unimpaired' } -- additional ] and [ related keybindings
  use { 'tpope/vim-repeat' }     -- repeat last command
  use { 'tpope/vim-sleuth' }     -- auto indent detection

  use {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end,
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup()
    end,
  }

  use { 'christoomey/vim-tmux-navigator' }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('configs.telescope')
    end,
  }

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
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'elixir',
          'hcl', -- terraform
          'heex', -- phoenix liveview templates
          'javascript',
          'json',
          'lua',
          'prisma', -- javascript ORM
          'python',
          'rust',
          'typescript',
        },

        highlight = {
          enable = true,
        },
      })

      -- Folding currently doesn't work with packer setup this way for some reason...
      -- vim.opt.foldmethod = 'expr'
      -- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
      -- vim.opt.foldlevel = 99 -- start with folds open

      -- Going old school for now
      vim.opt.foldmethod = 'indent'
      vim.opt.foldlevel = 99
    end,
  }

  use { 'cappyzawa/starlark.vim' }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
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

      -- Additonal autocomplete sources
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'cmp-nvim-lsp' },

      -- Additional packages
      { 'rafamadriz/friendly-snippets' },

      -- Additional language server set ups
      { 'simrat39/rust-tools.nvim' },
    },
    config = function()
      local lsp = require('lsp-zero').preset({})
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()
      local rust_tools = require('rust-tools')

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })

        -- Additional LSP related keybindings
        vim.keymap.set('n', '<Space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = true })
        vim.keymap.set({ 'n', 'x' }, '<Space>fm', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', { buffer = true })
        vim.keymap.set('n', '<Space>.', '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = true })
      end)

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
        'elixirls',
        'jsonls',
        'lua_ls',
        'prismals',
        'pyright',
        'rust_analyzer',
        'terraformls',
        'tsserver',
      })

      -- Skip these language servers as they have
      -- additional packages to help set up there config
      lsp.skip_server_setup({ 'rust_analyzer' })

      -- Set everything up
      lsp.setup()

      rust_tools.setup()

      -- IMPORTANT everything below this needs to be set up after lsp-zero

      -- Load "friendly-snippets" installed above
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        -- Additional completion sources
        -- (But overrides ones setup by lsp-zero so have to include them all)
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'luasnip' },
        },

        -- Additional completion menu key bindings
        mapping = {
          -- `Enter` key to confirm completion
          ['<CR>'] = cmp.mapping.confirm({ select = false }),

          -- Ctrl+Space to trigger completion menu
          ['<C-Space>'] = cmp.mapping.complete(),

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

  use {
    'folke/trouble.nvim',
    config = function()
      require('configs.trouble')
    end,
  }

  use { 'kyazdani42/nvim-web-devicons' }

  use {
    'kyazdani42/nvim-tree.lua',
    after = 'nvim-web-devicons',
    config = function()
      require('configs.nvimtree')
    end,
  }

  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup({
        style = 'dark',
        transparent = true,
      })

      require('onedark').load()
    end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    after = { 'onedark.nvim', 'nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'onedark',
        },
        sections = {
          lualine_c = { {'filename', path = 1 }},
        },
      })
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if installed_packer then
    packer.sync()
  end
end

local config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end,
  }
}

packer.startup({ plugins, config = config })
