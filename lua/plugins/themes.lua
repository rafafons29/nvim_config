local lazy_each_theme = {
  tokyonight = false,
  onedark = true,
  andromeda = true,
  oxocarbon = true,
}

return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = lazy_each_theme.tokyonight,
    main = 'config.plugins.tokyonight',
    config = true,
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    lazy = lazy_each_theme.onedark,
    main = 'config.plugins.onedark',
    config = true
  },
  {
    "nobbmaestro/nvim-andromeda",
    priority = 1000,
    lazy = lazy_each_theme.andromeda,
    dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" },
    main = 'config.plugins.andromeda',
    config = true
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
    lazy = lazy_each_theme.oxocarbon,
    main = 'config.plugins.oxocarbon',
    config = true
  },
}
