local nightfox = require("nightfox")
local colors = require("colors.colors")("oxocarbon")
local M = {}

function M.setup()
  nightfox.setup({
    options = {
      -- Compiled file's destination location
      compile_path = vim.fn.stdpath("cache") .. "/nightfox",
      compile_file_suffix = "_compiled", -- Compiled file suffix
      transparent = false,               -- Disable setting background
      terminal_colors = true,            -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      dim_inactive = false,              -- Non focused panes set to alternative background
      module_default = true,             -- Default enable value for modules
      colorblind = {
        enable = false,                  -- Enable colorblind support
        simulate_only = false,           -- Only show simulated colorblind colors and not diff shifted
        severity = {
          protan = 0,                    -- Severity [0,1] for protan (red)
          deutan = 0,                    -- Severity [0,1] for deutan (green)
          tritan = 0,                    -- Severity [0,1] for tritan (blue)
        },
      },
      styles = {           -- Style to be applied to different syntax groups
        comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
        conditionals = "NONE",
        constants = "NONE",
        functions = "NONE",
        keywords = "NONE",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "NONE",
        variables = "NONE",
      },
      inverse = { -- Inverse highlight for different types
        match_paren = false,
        visual = false,
        search = false,
      },
      modules = { -- List of various plugins and additional options
        -- ...
      },
    },
    palettes = {},
    specs = {},
    groups = {
      carbonfox = (function(hl, c)
        hl.CursorLineNr           = { fg = c.green2 }

        hl.MiniIndentscopeSymbol  = { fg = '#252525' }
        hl.LineNr                 = { fg = c.focus }
        hl.LineNrAbove            = { fg = '#363636' }
        hl.LineNrBelow            = { fg = '#363636' }
        hl.TreesitterContext      = { bg = '#232326' }

        hl.TelescopeNormal        = { bg = '#131313' }
        hl.TelescopePromptBorder  = { bg = '#292929', fg = '#292929' }
        hl.TelescopePromptNormal  = { bg = '#292929' }
        hl.TelescopePromptTitle   = { bg = c.red2, fg = c.bg }
        hl.TelescopePreviewBorder = { bg = '#131313', fg = '#131313' }
        hl.TelescopePreviewTitle  = { bg = c.green1, fg = c.bg }
        hl.TelescopeBorder        = { bg = '#131313', fg = '#131313' }
        hl.TelescopeResultsNormal = { bg = '#131313', fg = '#b2b8ca' }
        hl.TelescopeResultsBorder = { bg = '#131313', fg = '#131313' }

        return hl
      end)({}, colors)
    },
  })
end

return M
