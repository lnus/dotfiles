return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      highlights = {
        buffer_selected = { bold = true, italic = false },
      },
      options = {
        mode = 'buffers',
        modified_icon = '*',
        buffer_close_icon = '',
        separator_style = { '', '' },
        indicator = { style = 'none' },
        sort_by = 'insert_at_end',
      },
    }
  end,
}
