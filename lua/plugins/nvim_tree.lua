return {
  'nvim-tree/nvim-tree.lua',
  lazy = true,
  opts = {
    hijack_cursor = true,
    view = {
      width = 30,
      side = "right",
      cursorline = false,
      number = false,
      relativenumber = false,
    },
    renderer = {
      root_folder_label = false,
      indent_markers = {
        enable = true,
        inline_arrows = true,
      },
      icons = {
        show = {
          folder_arrow = false,
        },
        glyphs = {
          folder = {
            default = "󰉋",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
        },
      },
    },
    on_attach = function(bufnr)
      local bufmap = function(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
      end

      local api = require('nvim-tree.api')

      bufmap('L', api.node.open.edit, 'Expand folder or go to file')
      bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
      bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
      bufmap('a', api.fs.create, 'Create folder or file in the concurrent path.')
    end,
  },
  keys = {
    { "<leader>e", cmd "NvimTreeToggle", desc = "Toggle Nvim Tree" },
  },
}
