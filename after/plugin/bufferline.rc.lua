local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
  options = {
    numbers = 'none',
    separator_style = 'thin',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    indicator_icon = "▎",
    modified_icon = "●",
    custom_areas = {
      right = function()
        local result = {}
        local seve = vim.diagnostic.severity
        local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
        local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
        local info = #vim.diagnostic.get(0, { severity = seve.INFO })
        local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

        if error ~= 0 then
          table.insert(result, { text = "  " .. error, fg = "#EC5241" })
        end

        if warning ~= 0 then
          table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
        end

        if hint ~= 0 then
          table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
        end

        if info ~= 0 then
          table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
        end
        return result
      end,
    }
  },
  highlights = {
    fill = {
      bg = '#073642',
    },
    background = {
      fg = '#657b83',
      bg = '#002b36',
    },
    separator = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
  },
}

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
