local catppuccin = require("catppuccin")
local cat_color = require("colors.colors_catppuccin")
local M = {}

function M.setup()
  catppuccin.setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {     -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
    term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false,              -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15,            -- percentage of the shade to apply to the inactive window
    },
    no_italic = false,              -- Force no italic
    no_bold = false,                -- Force no bold
    no_underline = false,           -- Force no underline
    styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" },      -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = function(colors)
      local prompt = "#24283b"
      return {
        Normal                      = { bg = cat_color.base },
        SignColumn                  = { fg = cat_color.normal },
        NormalNC                    = { bg = cat_color.base },
        LineNr                      = { fg = cat_color.normal },
        LineNrAbove                 = { fg = cat_color.gray },
        LineNrBelow                 = { fg = cat_color.gray },
        Folded                      = { bg = cat_color.bg_dark, fg = cat_color.fg_a_z },
        FoldColumn                  = { bg = cat_color.bg_dark, fg = cat_color.fg_a_z },
        TreesitterContext           = { fg = cat_color.base },
        TreesitterContextLineNumber = {
          fg = cat_color.gray,
          bg = cat_color.base,
        },
        TelescopeNormal             = {
          bg = cat_color.bg_dark,
          fg = cat_color.fg_b_y,
        },
        TelescopeBorder             = {
          bg = cat_color.bg_dark,
          fg = cat_color.bg_dark,
        },
        TelescopePromptNormal       = {
          bg = prompt,
        },
        TelescopePromptBorder       = {
          bg = prompt,
          fg = prompt,
        },
        TelescopePromptTitle        = {
          bg = cat_color.red,
          fg = cat_color.bg_dark,
        },
        TelescopePreviewTitle       = {
          bg = cat_color.green,
          fg = cat_color.bg_dark,
        },
        TelescopeResultsTitle       = {
          bg = cat_color.base,
          fg = cat_color.base,
        },
      }
    end,
    default_integrations = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = true,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  })
end

return M
