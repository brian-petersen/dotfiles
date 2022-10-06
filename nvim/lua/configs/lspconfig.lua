local lspconfig = require('lspconfig')
local map = require('utils').map

local M = {}

M.capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

M.on_attach = function(client, bufnr)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { silent = true, buffer = bufnr }

  map('n', 'gd', vim.lsp.buf.definition, 'goto definition', bufopts)
  map('n', 'gr', vim.lsp.buf.references, 'goto references', bufopts)
  map('n', 'K', vim.lsp.buf.hover, 'hover', bufopts)
  -- using ray-x/lsp_signature.nvim instead
  -- map('i', '<C-k>', vim.lsp.buf.signature_help, 'signature help', bufopts)
  map('n', '<space>rn', vim.lsp.buf.rename, 'rename', bufopts)
  -- using CodeActionMenu instead
  -- map('n', '<space>ca', vim.lsp.buf.code_action, 'code action', bufopts)
  map('n', '<space>fm', vim.lsp.buf.formatting, 'formatting', bufopts)
  map('n', '[d', vim.diagnostic.goto_prev, 'goto next', bufopts)
  map('n', ']d', vim.diagnostic.goto_next, 'goto previous', bufopts)
end

lspconfig.jsonls.setup({
  capabilities = M.capabilities,
  on_attach = M.on_attach,
})

lspconfig.prismals.setup({
  capabilities = M.capabilities,
  on_attach = M.on_attach,
})

-- RUST NOT NEEDED SINCE HANDLED BY rust-tools.nvim PLUGIN

-- TODO get global `vim` working for lua config files
lspconfig.sumneko_lua.setup({
  capabilities = M.capabilities,
  on_attach = M.on_attach,
})

lspconfig.terraformls.setup({
  capabilities = M.capabilities,
  on_attach = M.on_attach,
})

lspconfig.tsserver.setup({
  capabilities = M.capabilities,
  on_attach = M.on_attach,
})

return M
