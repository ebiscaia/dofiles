local status_ok, _ = pcall(require, "lspconfig.configs")
if not status_ok then
  return
end

require("eddie.lsp.config")
require("eddie.lsp.handlers").setup()
require("eddie.lsp.null-ls")

--test
