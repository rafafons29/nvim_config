return {
  {
    "yorickpeterse/nvim-window",
    lazy = true,
    opts = {
      -- The characters available for hinting windows.
      chars = {
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
        'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
      },

      -- A group to use for overwriting the Normal highlight group in the floating
      -- window. This can be used to change the background color.
      normal_hl = 'Normal',

      -- The highlight group to apply to the line that contains the hint characters.
      -- This is used to make them stand out more.
      hint_hl = 'Italic',

      -- The border style to use for the floating window.
      border = 'single',

      -- How the hints should be rendered. The possible values are:
      --
      -- - "float" (default): renders the hints using floating windows
      -- - "status": renders the hints to a string and calls `redrawstatus`,
      --   allowing you to show the hints in a status or winbar line
      render = 'float',
    },
    keys = {
      { "<leader><leader>w", cmd "lua require('nvim-window').pick()", desc = "nvim-window: Jump to window" },
    },
  },
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    lazy = true,
    opts = {
      autowidth = {    --		       |windows.autowidth|
        enable = false,
        winwidth = 20, --		        |windows.winwidth|
        filetype = {   --	      |windows.autowidth.filetype|
          help = 2,
        },
      },
      ignore = { --			  |windows.ignore|
        buftype = { "quickfix" },
        filetype = { "NvimTree", "neo-tree", "undotree", "gundo" }
      },
      animation = {
        enable = true,
        duration = 150,
        fps = 90,
        easing = "in_out_sine"
      }
    },
    config = function(_, opts)
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup(opts)
    end,
    keys = {
      { '<C-w>z', cmd 'WindowsMaximize',             desc = "Set maximize window" },
      { '<C-w>>', cmd 'WindowsMaximizeVertically',   desc = "Set maximize vertical window" },
      { '<C-w>^', cmd 'WindowsMaximizeHorizontally', desc = "Set maximize horizontal window" },
      { '<C-w>=', cmd 'WindowsEqualize',             desc = "Set equal  window" },
    }
  }
}
