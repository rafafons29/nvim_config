local function minimal_theme(colors)
  return {
    normal = {
      a = { fg = colors.bg, bg = colors.focus },
      b = { fg = colors.blue1 },
      c = { fg = colors.green1 },
      x = { fg = colors.green1 },
      y = { fg = colors.blue1 },
      z = { fg = colors.blue1 },
    },

    insert = {
      a = { fg = colors.bg, bg = colors.green1 },
      z = { fg = colors.blue1 }
    },
    visual = {
      a = { fg = colors.bg, bg = colors.purple },
      z = { fg = colors.blue1 }
    },
    command = {
      a = { fg = colors.bg, bg = colors.purple },
      z = { fg = colors.blue1 }
    },
    replace = {
      a = { fg = colors.bg },
      z = { fg = colors.blue1 }
    },

    inactive = {
      a = { fg = colors.blue1 },
      b = { fg = colors.blue1 },
      c = { fg = colors.bg },
    },
  }
end
local colors = require("colors.colors")(theme_name)
local linelua = require("lualine")
local M = {}

function M.setup()
  linelua.setup {
    options = {
      icons_enabled = true,
      theme = minimal_theme(colors),
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        { 'mode', fmt = function(str)
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
        end }, -- right = ' '
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {
        {
          'diagnostics',
          source = { 'nvim' },
          sections = { 'error', 'warn' },
          diagnostics_color = {
            error = { fg = colors.red1 },
            warn = { fg = colors.yellow }
          },
        },
      },
      lualine_y = {
        { 'branch', icon = { '', align = 'right' }, color = { fg = colors.blue1 } },
        { 'progress', color = { fg = colors.orange } },
      },
      lualine_z = {
        { 'filetype',   icon_only = true },
        { 'fileformat', color = { fg = colors.green1 } }
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
end

return M
