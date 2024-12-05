local devicons = require('nvim-web-devicons')
local incline = require('incline')

local colors = require("colors.colors")(theme_name)

local M = {}

local function toggle_incline()
  local open_buffers = (function() return #vim.api.nvim_list_tabpages() end)()

  if open_buffers > 1 then
    incline.disable()
  else
    incline.enable()
  end
end

-- Cuando abrimos un buffer por primera vez se activa el callback
-- pero solo pasa la primera vez, luago no se hace la llamada al callback
vim.api.nvim_create_autocmd({ "TabEnter" }, {
  pattern = '*',
  callback = toggle_incline,
})

vim.api.nvim_create_autocmd({ "TabClosed" }, {
  pattern = '*',
  callback = toggle_incline
})

function M.setup()
  incline.setup {
    highlight = {
      groups = {
        InclineNormal = { guibg = colors.bg, guifg = colors.focus },
        InclineNormalNC = { guibg = colors.bg, guifg = colors.inactive }
      }
    },
    window = {
      margin = { vertical = 0, horizontal = 0 },
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
      if filename == '' then
        filename = '[No Name]'
      end
      local ft_icon, ft_color = devicons.get_icon_color(filename)

      return {
        { (ft_icon or '') .. ' ', guifg = ft_color,                                         guibg = 'none' },
        { filename .. ' ',        gui = vim.bo[props.buf].modified and 'italic' or 'italic' },
      }
    end,
  }
end

return M
