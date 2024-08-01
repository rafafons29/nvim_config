return {
  "smjonas/inc-rename.nvim",
  opts = {
    presets = { inc_rename = true }
  },
  config = function()
    require("inc_rename").setup()
  end,
  keys = {
    { '<leader>rn', ':IncRename ', mode = 'n' },
  }
}
