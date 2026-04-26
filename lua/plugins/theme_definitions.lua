-- Definición de todos los temas disponibles para lazy.nvim
return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('config.plugins.tokyonight').setup()
    end,
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('config.plugins.onedark').setup()
    end
  },
  {
    "nobbmaestro/nvim-andromeda",
    priority = 1000,
    lazy = false,
    dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" },
    config = function()
      require('config.plugins.andromeda').setup()
    end
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require('config.plugins.oxocarbon').setup()
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("config.plugins.catppuccin").setup()
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require('config.plugins.nightfox').setup()
    end,
  },
}
