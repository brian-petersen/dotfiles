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
      completion = { documentation = { auto_show = true } },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    lazy = false,
    keys = {
      { 'yoc', function() is_enabled = not is_enabled end, desc = 'Toggle blink completion' },
    },
  }
}
