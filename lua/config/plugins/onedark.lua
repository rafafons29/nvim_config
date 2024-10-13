local onedark = require("onedark")
local colors = require("colors.colors")("onedark")
local M = {}
function M.setup()
  onedark.setup {
    style = 'warmer',             -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,          -- Show/hide background
    term_colors = true,           -- Change terminal color as per the selected theme style
    ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
      comments = 'italic',
      keywords = 'none',
      functions = 'none',
      strings = 'none',
      variables = 'none'
    },
    highlights = (function(hl, c)
      hl.CursorLineNr           = { fg = c.green1 }

      hl.MiniIndentscopeSymbol  = { fg = c.active }
      hl.LineNr                 = { fg = c.focus }
      hl.LineNrAbove            = { fg = c.inactive }
      hl.LineNrBelow            = { fg = c.inactive }
      hl.TreesitterContext      = { bg = '#232326' }

      hl.TelescopeNormal        = { bg = '#1b1c1e' }
      hl.TelescopePromptBorder  = { bg = '#2b2c2e', fg = '#2b2c2e' }
      hl.TelescopePromptNormal  = { bg = '#2b2c2e' }
      hl.TelescopePromptTitle   = { bg = c.red1, fg = '#232326' }
      hl.TelescopePreviewBorder = { bg = '#1b1c1e', fg = '#1b1c1e' }
      hl.TelescopePreviewTitle  = { bg = c.green1, fg = '#1b1c1e' }
      hl.TelescopeBorder        = { bg = '#1b1c1e', fg = '#1b1c1e' }
      hl.TelescopeResultsNormal = { bg = '#1b1c1e', fg = colors.active }
      hl.TelescopeResultsBorder = { bg = '#1b1c1e', fg = '#1b1c1e' }

      return hl
    end)({}, colors),
    -- Custom Highlights --
    colors = { bg = colors.base, fg = colors.fg_dark },
    -- Plugins Config --
    diagnostics = {
      darker = true,      -- darker colors for diagnostic
      undercurl = true,   -- use undercurl instead of underline for diagnostics
      background = false, -- use background color for virtual text
    },
  }

  onedark.load()
end

return M
