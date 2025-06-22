-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "ts_ls",
  "tailwindcss",
  "eslint",
  "prismals",
  "clangd",
  "html",
  "cssls",
  "phpactor",
  "bashls",
  "lua_ls",
  "pyright",
  "gopls",
  "sqlls",
  "docker_compose_language_service",
  -- "yamlls",
}

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
--
--
lspconfig.sqlls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "sql" },
}

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.phpactor.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
