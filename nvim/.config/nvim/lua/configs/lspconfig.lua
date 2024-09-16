-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "tsserver", "tailwindcss", "eslint", "prismals", "clangd", "html", "cssls", "phpactor", "bashls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- -- TailwindCSS setup: apply to specific file types
-- lspconfig.tailwindcss.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
--   filetypes = { "html", "css", "javascript", "typescript", "jsx", "tsx" }, -- Remove PHP
-- }

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.phpactor.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
