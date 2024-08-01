return {
  {
    'echasnovski/mini.animate',
    opts = {
      cursor = { enable = false },
      open = { enable = false },
      close = { enable = false },
      scroll = { enable = false },
      resize = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear({ duration = 10, unit = "total" }),
      },
    }
  },
  {
    'echasnovski/mini.indentscope',
    opts = {
      options = {
        try_as_border = true,
        border = 'top',
      },
      symbol = '▏',
    }
  }
}
