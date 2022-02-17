local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.prettier,
    formatting.black.with({
      extra_args = { "--fast" }
    }),
    formatting.gofmt,
    formatting.shfmt,
    formatting.clang_format,
    formatting.cmake_format,
    formatting.dart_format,
    formatting.lua_format.with({
      extra_args = {
        '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
        '--break-after-table-lb', '--indent-width=2'
      }
    }),
    formatting.isort,
    formatting.codespell.with({ filetypes = { 'markdown' } })
  },
  on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
          vim.cmd([[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]])
      end
      if client.supports_method("textDocument/formatting") then
          vim.cmd([[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePost <buffer> lua formatting(vim.fn.expand("<abuf>"))
        augroup END
      ]])
      end
  end,
})

require('lspconfig').tsserver.setup({
  on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
  end,
})
