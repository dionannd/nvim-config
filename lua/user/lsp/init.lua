local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

lspconfig.tsserver.setup({
  on_attach = function (client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
})

require "user.lsp.lsp-installer"
require "user.lsp.lsp-signature"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
