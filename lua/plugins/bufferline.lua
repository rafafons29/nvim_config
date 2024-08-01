local colors = require("colors.colors_tokyonight")

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
          fg = colors.normal,
          bold = true,
        },
      },
    }
  end,
  keys = {
    { 'te',      cmd 'tabedit',             mode = 'n', desc = "Create new tab" },
    { '<Tab>',   cmd 'BufferLineCycleNext', mode = 'n', desc = "Go to next buffer" },
    { '<S-Tab>', cmd 'BufferLineCyclePrev', mode = 'n', desc = "Go to preview buffer" },
  }
}
