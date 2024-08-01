return {
  'williamboman/mason.nvim',
  lazy = false,
  dependencies = 'williamboman/mason-lspconfig.nvim',
  config = function()
    local mason = require("mason")
    local lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_pending = " ",
          package_installed = "󰄳 ",
          package_uninstalled = " 󰚌",
        },

        keymaps = {
          toggle_server_expand = "<CR>",
          install_server = "i",
          update_server = "u",
          check_server_version = "c",
          update_all_servers = "U",
          check_outdated_servers = "C",
          uninstall_server = "X",
          cancel_installation = "<C-c>",
        },
      },

      max_concurrent_installers = 10,
    })

    lspconfig.setup {
      automatic_installation = true
    }

    -- keymap.set('n', '<leader>cm', cmd 'Mason')
  end,
  keys = {
    { '<leader>cm', cmd 'Mason', mode = 'n' }
  }
}
