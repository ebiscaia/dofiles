local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end
---
---local lspconfig = require("lspconfig")
---
local servers = {
  "html",
  "clangd",
  "cssls",
  "emmet_ls",
  "jsonls",
  "sumneko_lua",
  "jedi_language_server",
}

mason.setup()

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("eddie.lsp.handlers").on_attach,
    capabilities = require("eddie.lsp.handlers").capabilities,
  }

  if server == "sumneko_lua" then
    local sumneko_opts = require("eddie.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end
  lspconfig[server].setup(opts)
end
