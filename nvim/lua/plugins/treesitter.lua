return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'elixir',
          'gleam',
          'hcl', -- terraform
          'heex', -- phoenix liveview templates
          'javascript',
          'json',
          'lua',
          'ocaml',
          'ocaml_interface',
          'prisma', -- javascript ORM
          'python',
          'rust',
          'terraform',
          'typescript',
        },

        highlight = {
          enable = true,
        },
      })
    end,
  },
}
