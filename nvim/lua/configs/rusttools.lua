local rt = require('rust-tools')
local lspconfig = require('configs.lspconfig')

rt.setup({
  server = {
    capabilities = lspconfig.capabilities,
    on_attach = lspconfig.on_attach,
  },
})
