return {
  'akinsho/bufferline.nvim',
  opts = function()
    return {
      options = {
        mode = "tabs",
        separator_style = 'slope',
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        style_preset = require('bufferline').style_preset.minimal,
      },
      highlights = {
        buffer_selected = {
          fg = require("colors.colors_" .. theme_name).normal,
          bold = true,
        },
      },
    }
  end,
  keys = {
    { 'te',      cmd 'tabedit',             desc = "Create new tab" },
    { '<Tab>',   cmd 'BufferLineCycleNext', desc = "Go to next buffer" },
    { '<S-Tab>', cmd 'BufferLineCyclePrev', desc = "Go to preview buffer" },
  }
}
