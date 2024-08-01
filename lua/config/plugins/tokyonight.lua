local tokyonight = require('tokyonight')
local M = {}

function M.setup()
  tokyonight.setup({
    style = "night",        -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
    light_style = "day",    -- The theme is used when the background is set to light
    transparent = false,    -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "dark", -- style for sidebars, see below
      floats = "dark",   -- style for floating windows
    },
    on_colors = function(colors) end,

    on_highlights = function(hl, c)
      local prompt = "#24283b"
      -- hl.Comment = { fg = c.gray }
      hl.Constant = { fg = c.orange }
      hl.String = { fg = c.yellow }
      hl.Function = { fg = c.green }
      hl.Keyword = { fg = c.red }
      hl.Identifier = { fg = c.orange }
      hl.Statement = { fg = c.red }
      hl.Type = { fg = c.blue }
      hl.Special = { fg = c.purple }
      hl.Underlined = { fg = c.blue6 }
      hl.LineNr = { fg = c.blue }
      hl.VertSplit = { fg = c.red }
      hl.Folded = { bg = c.bg_dark, fg = c.fg_dark }
      hl.FoldColumn = { bg = c.bg_dark, fg = c.fg_dark }

      hl.TreesitterContext = { bg = c.bg }

      hl.TelescopeNormal = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
      hl.TelescopeBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopePromptNormal = {
        bg = prompt,
      }
      hl.TelescopePromptBorder = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePromptTitle = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePreviewTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopeResultsTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
    end,

    cache = true, -- When set to true, the theme will be cached for better performance
  })
end

return M
