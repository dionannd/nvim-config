local M = {}

function M.toggleInlayHints()
    if vim.lsp.inlay_hint.is_enabled(0) then
        vim.lsp.inlay_hint.disable(0)
    else
        vim.lsp.inlay_hint.enable(0)
    end
end

return M
