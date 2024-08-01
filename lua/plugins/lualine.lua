local function minimal_theme(colors)
  return {
    normal = {
      a = { fg = colors.fg_a_z, bg = colors.normal },
      b = { fg = colors.fg_b_y },
      c = { fg = colors.insert },
      x = { fg = colors.insert },
      y = { fg = colors.fg_b_y },
      z = { fg = colors.fg_b_y },
    },

    insert = {
      a = { fg = colors.fg_a_z, bg = colors.insert },
      z = { fg = colors.fg_b_y }
    },
    visual = {
      a = { fg = colors.fg_a_z, bg = colors.visual },
      z = { fg = colors.fg_b_y }
    },
    replace = {
      a = { fg = colors.fg_a_z },
      z = { fg = colors.fg_b_y }
    },

    inactive = {
      a = { fg = colors.fg_b_y },
      b = { fg = colors.fg_b_y },
      c = { fg = colors.fg_a_z },
    },
  }
end
local colors = require("colors.colors_tokyonight")

return {
  'nvim-lualine/lualine.nvim',
  opts = function()
    return {
      options = {
        icons_enabled = true,
        theme = minimal_theme(colors), -- Pass colors directly
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              local sfm = {
                normal = "󰝆",
                visual = "𝐕",
                select = "𝙎",
                insert = "",
                terminal = "𝙏",
                command = "𝐂"
              }
              if str == "NORMAL" then
                return sfm.normal
              end
              if str == "V-LINE" then
                return sfm.visual
              end
              if str == "SELECT" then
                return sfm.select
              end
              if str == "INSERT" then
                return sfm.insert
              end
              if str == "TERMINAL" then
                return sfm.terminal
              end
              if str == "COMMAND" then
                return sfm.command
              end

              return str:sub(1, 1)
            end
          }, -- right = ' '
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {
          {
            'diagnostics',
            source = { 'nvim' },
            sections = { 'error', 'warn' },
            diagnostics_color = {
              error = { fg = colors.red },
              warn = { fg = colors.yellow }
            },
          },
        },
        lualine_y = {
          { 'branch', icon = { '', align = 'right' }, color = { fg = colors.fg_b_y } },
          { 'progress', color = { fg = colors.orange } },
        },
        lualine_z = {
          { 'filetype',   icon_only = true },
          { 'fileformat', color = { fg = colors.blue } }
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {
        'toggleterm',
        'nvim-tree',
        'mason',
        'fzf'
      },
    }
  end,
}
