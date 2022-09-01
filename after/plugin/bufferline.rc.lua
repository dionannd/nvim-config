local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup(nvim.user_plugin_opts('bufferline', {
  options = {
    mode = 'tabs',
    numbers = 'none',
    offsets = {
      { filetype = 'Outline', text = '', padding = 1 }
    },
    buffer_close_icon = '',
    modified_icon = '',
    close_icon = '',
    max_prefix_length = 13,
    max_name_length = 14,
    tab_size = 20,
    separator_style = 'thin',
    always_show_bufferline = true,
    -- show_buffer_close_icons = false,
  },
}))

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
