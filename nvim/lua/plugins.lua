-- To add a new language, you'll want to
--
--   1. Get the treesitter parser
--      (Update 'ensure_installed' under 'nvim-treesitter/nvim-treesitter')
--      (See :TSInstallInfo for list of available options)
--
--   2. Add the language server
--      (Update 'ensure_installed' under 'williamboman/mason-lspconfig.nvim')
--      (See https://github.com/williamboman/mason-lspconfig.nvim)
--
--   3. Update 'configs.lspconfig' to setup the language server stuffs
--      (Will use the same key as in step 2)

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

  -- use { 'tpope/vim-sensible' } -- sensible defaults
  use { 'tpope/vim-fugitive' } -- git wrapper
  use { 'tpope/vim-rhubarb' } -- github integration for fugitive
  use { 'tpope/vim-unimpaired' } -- additional ] and [ related keybindings
  use { 'tpope/vim-repeat' } -- repeat last command
  use { 'tpope/vim-sleuth' } -- auto indent detection
  -- use { 'tpope/vim-dispatch' } -- asynchronous actions

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
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'javascript',
          'json',
          'hcl', -- terraform
          'lua',
          'prisma', -- javascript ORM
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

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  }

  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    after = 'mason.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'jsonls',
          'prismals',
          'rust_analyzer',
          'sumneko_lua',
          'terraformls',
          'tsserver',
        },
      })
    end,
  }

  use { 'hrsh7th/cmp-nvim-lsp' }

  use {
    'weilbith/nvim-code-action-menu',
    config = function()
      require('configs.codeaction')
    end,
  }

  use {
    'neovim/nvim-lspconfig',
    after = { 'mason-lspconfig.nvim', 'cmp-nvim-lsp' },
    config = function()
      require('configs.lspconfig')
    end,
  }

  use {
    'simrat39/rust-tools.nvim',
    after = { 'nvim-lspconfig' },
    config = function()
      require('configs.rusttools')
    end,
  }

  use {
    'folke/trouble.nvim',
    config = function()
      require('configs.trouble')
    end,
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup()
    end,
  }

  use { 'hrsh7th/cmp-buffer' }

  use { 'hrsh7th/cmp-path' }

  use { 'rafamadriz/friendly-snippets' }

  use {
    'L3MON4D3/LuaSnip',
    after = 'friendly-snippets',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  }

  use { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' }

  use {
    'hrsh7th/nvim-cmp',
    after = { 'cmp-nvim-lsp', 'cmp-buffer', 'cmp-path', 'cmp_luasnip' },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      vim.opt.completeopt = 'menu,menuone,noselect'

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm(),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {
            'i',
            's',
          }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            'i',
            's',
          }),
        },

        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },
      })
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
        style = 'warm',
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

packer.startup({plugins, config = config })
