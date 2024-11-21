return {
  {
    'nvim-neotest/neotest',
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-elixir')({
            -- Modified filter dir to allow running test files under 'lib/'.
            -- Taken from https://github.com/jfpedroza/neotest-elixir/blob/a242aebeaa6997c1c149138ff77f6cacbe33b6fc/lua/neotest-elixir/init.lua#L43
            filter_dir = function(_name, rel_path, _root)
              return rel_path == 'test'
                  or vim.startswith(rel_path, 'test/')
                  or rel_path == 'lib'
                  or vim.startswith(rel_path, 'lib/')
                  or rel_path == 'apps'
                  or rel_path:match('^apps/[^/]+$')
                  or rel_path:match('^apps/[^/]+/test')
            end,
          }),
        },
      })
    end,
    keys = {
      { '<leader>tn', function() require('neotest').run.run() end, desc = '[T]est [n]earest' },
      { '<leader>tb', function() require('neotest').run.run(vim.fn.expand('%')) end, desc = '[T]est [b]uffer' },
      { '<leader>tl', function() require('neotest').run.run_last() end, desc = '[T]est [l]ast' },

      { '<leader>ts', function() require('neotest').summary.toggle() end, desc = '[T]est [s]ummary toggle' },
      { '<leader>to', function() require('neotest').output_panel.toggle() end, desc = '[T]est [o]utput panel toggle' },
      { '<leader>tc', function() require('neotest').output_panel.clear() end, desc = '[T]est output panel [c]lear' },
    },
    dependencies = {
      -- General neotest deps
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',

      -- Language specific adapters
      'jfpedroza/neotest-elixir'
    },
  },
}
