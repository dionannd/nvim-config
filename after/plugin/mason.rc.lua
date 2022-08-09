local status, mason = pcall(require, 'mason')
local status2, lspconfig = pcall(require, 'mason-lspconfig')
if (not status) then return end
if (not status2) then return end

mason.setup({

})

lspconfig.setup {
  ensure_installed = { 'sumneko_lua', 'tailwindcss' },
}
