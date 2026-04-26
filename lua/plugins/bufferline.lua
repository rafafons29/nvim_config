return {
  'akinsho/bufferline.nvim',
  opts = function()
    local theme = _G.theme_name or "catppuccin"
    local colors = require("colors.colors")(theme)
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
          fg = colors.focus,
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
