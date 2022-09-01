local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

null_ls.setup {
  debug = false,
  source = {
    formatting.prettier.with({ extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' } }),
    formatting.black.with({ extra_args = '--fast' }),
    formatting.stylua,
    diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})',
    }),
    diagnostics.fish
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds {
        group = augroup_format,
        buffer = 0,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = 0,
        callback = function()
          vim.lsp.buf.formatting_seq_sync()
        end
      })
    end
  end,
}
