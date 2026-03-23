local function cmd_fallback(cmd)
  vim.cmd("split | term " .. cmd)
end

local function run_in_smart_tmux(cmd)
  if not os.getenv("TMUX_PANE") then
    cmd_fallback(cmd)
    return
  end

  local query = "tmux list-panes -F '#{pane_id} #{pane_at_right} #{pane_current_command}'"
  local handle = io.popen(query)
  local result = handle:read("*a")
  handle:close()

  local target_pane = nil
  local shell_list = { ["zsh"] = true, ["bash"] = true, ["sh"] = true, ["fish"] = true }

  for line in result:gmatch("[^\r\n]+") do
    local id, is_right, current_proc = line:match("(%%%d+) (%d) ([%w%-]+)")
    if is_right == "1" and shell_list[current_proc] then
      target_pane = id
      break
    end
  end

  if target_pane then
    -- Clear the line (C-u) and run the command (C-m is Enter)
    local tmux_cmd = string.format("tmux send-keys -t %s C-u '%s' C-m", target_pane, cmd)
    os.execute(tmux_cmd)
  else
    cmd_fallback(cmd)
  end
end

return {
  {
    'vim-test/vim-test',
    config = function()
      vim.g["test#custom_strategies"] = {
        smart_tmux = function(cmd)
          run_in_smart_tmux(cmd)
        end
      }

      vim.g["test#strategy"] = "smart_tmux"
    end,
    keys = {
      { '<leader>tn', ':TestNearest<CR>', desc = '[T]est [n]earest' },
      { '<leader>tb', ':TestFile<CR>',    desc = '[T]est [b]uffer' },
      { '<leader>tl', ':TestLast<CR>',    desc = '[T]est [l]ast' },
    },
  }
}
