return {
  'akinsho/toggleterm.nvim',
  version = "*",
  lazy = true,
  opts = {
    size = 70,
    open_mapping = [[<c-g>]],
    direction = 'float',
    shell = 'fish',
  },
  keys = {
    '<C-g>',
    cmd "require('toggleterm').toggle()",
    desc = "Toggle terminal",
  },
}
