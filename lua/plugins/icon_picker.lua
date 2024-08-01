return {
  "ziontee113/icon-picker.nvim",
  lazy = true,
  config = function()
    require("icon-picker").setup({ disable_legacy_commands = true })
  end,
  keys = {
    { '<Leader><Leader>i', cmd 'IconPickerNormal', mode = 'n' },
    { '<Leader><Leader>y', cmd 'IconPickerYank',   mode = 'n' },
    { '<C-i>',             cmd 'IconPickerInsert', mode = 'i' }
  }
}
