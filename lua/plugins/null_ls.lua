return {
  'jose-elias-alvarez/null-ls.nvim',
  cmd = { 'NullLsInfo', 'NullLsInstall', 'NullLsUninstall' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  main = "config.plugins.null_ls.lua",
  config = true
}
