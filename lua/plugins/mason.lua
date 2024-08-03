return {
  'williamboman/mason.nvim',
  lazy = false,
  dependencies = 'williamboman/mason-lspconfig.nvim',
  opts = {
    ui = {
      ensure_installed = {
        "lua-language-server",
        "markdownlint",
      },
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
  },
  keys = {
    { '<leader>cm', cmd 'Mason', mode = 'n' }
  }
}
