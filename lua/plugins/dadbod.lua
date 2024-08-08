return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod',                     lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_force_echo_notifications = 0
    vim.g.db_ui_win_position = "left"
    vim.g.db_ui_winwidth = 50
    vim.g.db_ui_execute_on_save = 0
    vim.g.db_ui_show_database_icon = 1
  end,
  keys = {
    { '<leader><leader>db', cmd 'DBUI', desc = "Open database client" },
  }
}
