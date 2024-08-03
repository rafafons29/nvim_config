local onedark = require("onedark")
local colors = require("colors.colors_onedark")
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

    -- Custom Highlights --
    colors = { bg = colors.base, fg = colors.fg_dark },
    highlights = {
      CursorLineNr = { fg = colors.blue },

      MiniIndentscopeSymbol = { fg = colors.fg_b_y },
      TreesitterContext = { bg = '#232326' },

      TelescopeNormal = { bg = colors.bg_dark, fg = colors.fg_dark },
      TelescopePromptBorder = { bg = "#32363a", fg = "#32363a" },
      TelescopePromptNormal = { bg = "#32363a" },
      TelescopePromptTitle = { bg = "#32363a" },
      TelescopePreviewBorder = { bg = colors.bg_dark, fg = colors.bg_dark },
      TelescopeBorder = { bg = colors.bg_dark, fg = colors.bg_dark },
      TelescopeResultsNormal = { bg = colors.bg_dark, fg = colors.fg_dark },
      TelescopeResultsBorder = { bg = colors.bg_dark, fg = colors.bg_dark }
    },

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
