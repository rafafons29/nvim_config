local colors = require("colors.colors_tokyonight")
return {
  'b0o/incline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    local devicons = require('nvim-web-devicons')
    local helpers = require('incline.helpers')

    local function toggle_incline()
      local open_buffers = #vim.api.nvim_list_tabpages()

      if open_buffers > 1 then
        require('incline').disable()
      else
        require('incline').enable()
      end

      return open_buffers
    end

    vim.api.nvim_create_autocmd("TabEnter", {
      pattern = '*',
      callback = toggle_incline,
    })

    vim.api.nvim_create_autocmd("TabClosed", {
      pattern = '*',
      callback = function()
        vim.schedule(toggle_incline)
      end,
    })

    return {
      highlight = {
        groups = {
          InclineNormal = { guibg = colors.base, guifg = colors.normal },
          InclineNormalNC = { guibg = colors.base, guifg = colors.fg_b_y },
        },
      },
      window = {
        margin = { vertical = 0, horizontal = 0 },
      },
      hide = {
        cursorline = true,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        if filename == '' then
          filename = '[No Name]'
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)

        return {
          { (ft_icon or '') .. ' ', guifg = ft_color,                                            guibg = 'none' },
          { filename .. ' ',        gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
        }
      end,
    }
  end,
}
