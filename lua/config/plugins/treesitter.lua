local ts = require("nvim-treesitter.configs")

local M = {}

function M.setup()
  ts.setup {
    auto_install = false,
    ignore_install = {},
    modules = {},

    -- A list of parser names, or "all"
    ensure_installed = {
      "lua",
      "cpp",
      "c",
      "python",
      "go",
      "html",
      "css",
      "vimdoc",
      "markdown",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- list of language that will be disabled
      disable = {},

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm"
      }
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
      colors = {
        '#00e8c6', -- cyan
        '#42be65', --  green,
        '#FC644D', -- red,
        '#9040C4', -- violet,
        '#00b0ff', -- blue
        '#FFE66D', -- yellow,
        '#FF855B', -- orange
      },
    }
  }
end

return M
