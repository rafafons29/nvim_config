local nightfox = require("nightfox")
local colors = require("colors.colors")("carbonfox")
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
        hl.CursorLineNr           = { fg = c.focus }

        hl.MiniIndentscopeSymbol  = { fg = c.black5 }
        hl.LineNr                 = { fg = c.focus }
        hl.LineNrAbove            = { fg = c.black4 }
        hl.LineNrBelow            = { fg = c.black4 }
        hl.TreesitterContext      = { bg = c.bg }

        hl.TelescopeNormal        = { bg = c.black6 }
        hl.TelescopePromptBorder  = { bg = c.black3, fg = c.black3 }
        hl.TelescopePromptNormal  = { bg = c.black3 }
        hl.TelescopePromptTitle   = { bg = c.red2, fg = c.bg }
        hl.TelescopePreviewBorder = { bg = c.black6, fg = c.black6 }
        hl.TelescopePreviewTitle  = { bg = c.green1, fg = c.bg }
        hl.TelescopeBorder        = { bg = c.black6, fg = c.black6 }
        hl.TelescopeResultsNormal = { bg = c.black6, fg = c.white3 }
        hl.TelescopeResultsBorder = { bg = c.black6, fg = c.black6 }

        hl.CmpNormal              = { fg = c.active }
        hl.MyBorder               = { fg = c.black2 }

        return hl
      end)({}, colors)
    },
  })
end

return M
