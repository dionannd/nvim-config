local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
  options = {
    mode = 'tabs',
    numbers = 'none',
    separator_style = 'thin',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    indicator = {
      icon = '▎',
      style = 'icon'
    },
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    modified_icon = '',
    close_icon = '',
    -- buffer_close_icon = '',
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
