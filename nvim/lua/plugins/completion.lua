local is_enabled = true

return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      enabled = function()
        return is_enabled
      end,
      keymap = { preset = 'enter' },
      completion = {
        documentation = { auto_show = true },
        list = { selection = { preselect = false } },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    lazy = false,
    keys = {
      {
        'yoc',
        function()
          is_enabled = not is_enabled

          if is_enabled then
            vim.api.nvim_echo({ { 'Blink completion enabled' } }, false, {})
          else
            vim.api.nvim_echo({ { 'Blink completion disabled' } }, false, {})
          end
        end,
        desc = 'Toggle blink completion'
      },
    },
  }
}
